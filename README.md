Open Source Code and Data for Wake County Fire Services Planning
================================================================

Setup
-----

Install [Pipenv](https://pipenv.readthedocs.io/en/latest/)

Install [Git Large File Support](https://git-lfs.github.com/)

To pull down the larger data files from github:
```
git lfs pull
```

To install the needed Python pacakges:
```
pipenv sync
```

Data
----

All Wake County non-EMS fire calls since 2007:

https://data-wake.opendata.arcgis.com/datasets/ral::fire-incidents

Filename: Fire_Incidents.csv

Example Analysis
----------------

Launch this [Jupyter Notebook](https://jupyter.org/) to see call volume:
```
pipenv run jupyter notebook call-volume-trends.ipynb
```
