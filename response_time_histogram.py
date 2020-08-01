"""
Generate a histogram of emergency services response times

Uses data from data/ResponseTimes-3.sql, loaded into MySQL
"""
from datetime import timedelta
import os

# https://github.com/mysql/mysql-connector-python
import mysql.connector
import numpy as np
import pandas as pd

import matplotlib
# matplotlib.use("agg")  # noqa: E402
matplotlib.use("TkAgg")  # noqa: E402
import matplotlib.pyplot as plt

DATABASE_NAME = 'WakeFireCalls'


def get_db_connection():
    option_filename = os.path.expanduser('~/.my.cnf')
    conn = mysql.connector.connect(option_files=[option_filename],
                                   database=DATABASE_NAME)
    return conn


def get_response_times(conn):
    query_filename = 'response-times-query-1.sql'
    print(f"Finding first response times using query: {query_filename}")
    with open(query_filename) as f:
        df = pd.read_sql(f.read(), conn)
    print(f"First response times: {len(df)} rows")

    # Fix column types
    travel_times = df['COL12']
    df['COL12'] = pd.to_numeric(travel_times)

    # Clean the data

    n = len(df.loc[df['COL12'] < 1])
    print(f"Removing {n} rows where travel time is less than one second")
    df = df.drop(np.where(df['COL12'] < 0)[0])

    n = len(df.loc[df['COL12'] > 5400.0])
    print(f"Removing {n} rows where travel time is more than 90 minutes")
    df = df.drop(np.where(df['COL12'] > 5400.0)[0])

    return df


def calc_travel_times_histogram(travel_times, num_bins=100):
    h = np.histogram(travel_times, bins=num_bins)
    return h


def timedelta_str(seconds):
    """
    seconds: Time in seconds, floating point
    Return seconds converted to a time delta, rounded to nearest second,
    converted to a string, with leading zeros trimmed.
    """
    s = str(timedelta(seconds=round(seconds)))
    while True:
        next_s = s.lstrip("0")
        if next_s == s:
            break
        s = next_s
        next_s = s.lstrip(":")
        if next_s == s:
            break
        s = next_s
    return s


def plot_travel_times_histogram(travel_times,
                                num_bins=100,
                                title="First Response Travel Times",
                                png_filename='travel-times-histogram.png'):
    # Set up for plotting
    fig = plt.figure(figsize=(10.24, 7.68), dpi=100)
    nrows, ncols, axnum = 1, 1, 1
    ax = fig.add_subplot(nrows, ncols, axnum)
    ax.set_title(title)
    ax.set_xmargin(0.05)
    ax.set_ymargin(0.10)
    ax.set_xlabel("Travel time in seconds")
    ax.set_ylabel("Number of incidents")

    # Generate the histogram plot
    ax.hist(travel_times, bins=num_bins)

    # Plot the 90th percentile point
    t90 = np.percentile(travel_times, 90)
    h = np.histogram(travel_times, bins=num_bins)[0]
    for y in np.linspace(0.0, max(h), 40):
        ax.plot(t90, y, 'o', color='red', markersize=2)

    # Place some text with additional info
    mean = sum(travel_times) / len(travel_times)
    msg = (
        f"Mean travel time: {timedelta_str(mean)}\n"
        f"90th percentile time: {timedelta_str(t90)}\n"
        f"Total number of incidents: {len(travel_times)}"
    )
    ax.text(max(travel_times) / 2.0, max(h) / 2.0, msg,
            horizontalalignment="center")

    # Save the plot by calling plt.savefig() BEFORE plt.show()
    print("Writing plot image to", png_filename)
    fig.savefig(png_filename, dpi=100)

    # Interactive display
    plt.show()


def main():
    print("Emergency Response Time Histogram")
    conn = get_db_connection()
    cur = conn.cursor()
    cur.execute("SELECT COUNT(*) FROM ResponseTimes")
    row = cur.fetchone()
    print(f"{row[0]} rows in table ResponseTimes")
    df = get_response_times(conn)
    conn.close()

    travel_times = df['COL12']

    mean = sum(travel_times) / len(travel_times)
    print(f"Mean travel time: {mean:.1f}".format(mean))

    t90 = np.percentile(travel_times, 90)
    print(f"90th percentile travel time: {t90:.1f} seconds")

    plot_travel_times_histogram(travel_times)


if __name__ == '__main__':
    main()
