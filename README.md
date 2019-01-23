Open Source Code and Data for Wake County Fire Services Planning
================================================================

Setup
-----

Install [Miniconda](https://repo.anaconda.com/)

Run these commands:
```
conda create -n wake-fire-planning 'python>=3.7'
conda activate wake-fire-planning
conda install ipython matplotlib pandas jupyter
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

Start [Jupyter Notebook]() with the call volume trends analysis:

```
jupyter notebook call-volume-trends.ipynb
```
