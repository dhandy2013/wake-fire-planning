Open Source Code and Data for Wake County Fire Services Planning
================================================================

Setup
-----

Install [Miniconda](https://repo.anaconda.com/)

Run these commands:
```
conda create -n wake-fire-planning 'python>=3.7'
conda activate wake-fire-planning
conda install ipython matplotlib pandas ipykernel
```

Create a data subdirectory:
```
mkdir data
```

Put downloaded files here.

Data
----

All Wake County non-EMS fire calls since 2007:

https://data-wake.opendata.arcgis.com/datasets/ral::fire-incidents

Filename: Fire_Incidents.csv

Example Analysis
----------------

Loading the data into [Pandas](http://pandas.pydata.org/pandas-docs/stable/10min.html):
```
ipython

import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
%matplotlib tk

# Load the Fire Incidents file, indexed by dispatch time
# TODO: What if two incidents had the same dispatch_date_time value?
df = fire_incidents = pd.read_csv('data/Fire_Incidents.csv',
                                  index_col='dispatch_date_time')
print(len(df))  # 177738

# Convert index to correct data type
df.index = pd.to_datetime(df.index)

# Sort rows by time, using a stable sort
df.sort_index(inplace=True, kind='mergesort')

# Filter out rows with missing/invalid dispatch times
print(len(df[df.index.notnull()]))  # 176284
df.drop(df.index[sum(df.index.notnull()):], inplace=True)

# Count incidents by month and year
monthly = df.groupby(pd.Grouper(freq='M')).count()
yearly = df.groupby(pd.Grouper(freq='Y')).count()

# Plot number of yearly incidents except for latest (incomplete) year
yearly['incident_number'][:-1].plot()

```
