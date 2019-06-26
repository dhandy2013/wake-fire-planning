%matplotlib notebook

def graph_dispatches_for_dept_by_month(dept_name):
    return graph_dispatches_by_month(dept_name, df['Department'] == dept_name)

def graph_dispatches_by_month(name, filter_result):
    events = df[ filter_result ]
    d = pd.DataFrame({f"{name} Dispatches": events.index},
                     index=events['Dispatch Time'])
    events_monthly = d.groupby(pd.Grouper(freq='M')).count()
    return events_monthly.plot(title=f"{name} Dispatches by Month")


from datetime import datetime
name = dept_name = "Fairview Fire"
events = df
events = events[ events['Department'] == dept_name ]
events = events[ events['Dispatch Time'] >= datetime(2015, 7, 1) ]
events = events[ events['Dispatch Time'] < datetime(2016, 7, 1) ]

d = pd.DataFrame({f"{name} Dispatches": events.index},
                 index=events['Dispatch Time'])
events_monthly = d.groupby(pd.Grouper(freq='W')).count()
p = events_monthly.plot(title=f"{name} Dispatches by Week")


from datetime import datetime
name = dept_name = "Fairview Fire"
events = df
events = events[ events['Department'] == dept_name ]
events = events[ events['Dispatch Time'] >= datetime(2016, 1, 1) ]
events = events[ events['Dispatch Time'] < datetime(2016, 3, 1) ]

d = pd.DataFrame({f"{name} Dispatches": events.index},
                 index=events['Dispatch Time'])
events_monthly = d.groupby(pd.Grouper(freq='D')).count()
p = events_monthly.plot(title=f"{name} Dispatches by Day")


from datetime import datetime
name = dept_name = "Fairview Fire"
events = df
events = events[ events['Department'] == dept_name ]
events = events[ events['Dispatch Time'] >= datetime(2016, 1, 20) ]
events = events[ events['Dispatch Time'] < datetime(2016, 1, 26) ]

d = pd.DataFrame({f"{name} Dispatches": events.index},
                 index=events['Dispatch Time'])
events_monthly = d.groupby(pd.Grouper(freq='H')).count()
p = events_monthly.plot(title=f"{name} Dispatches by Hour")
