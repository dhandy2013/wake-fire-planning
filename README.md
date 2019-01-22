= Open Source Code and Data for Wake County Fire Services Planning =

== Setup ==

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

== Data ==

All Wake County non-EMS fire calls since 2007:

https://data-wake.opendata.arcgis.com/datasets/ral::fire-incidents

Filename: Fire_Incidents.csv

Loading the data into [Pandas](http://pandas.pydata.org/pandas-docs/stable/10min.html):
```
ipython

import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
%matplotlib tk

fire_incidents = pd.read_csv('data/Fire_Incidents.csv')
```
