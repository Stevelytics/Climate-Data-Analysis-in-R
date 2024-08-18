# Climate Data Analysis in R
This repository contains R scripts for analyzing climate data, particularly focusing on precipitation and temperature metrics from 1981-2010. The analysis includes processing seasonal averages, subsetting geographical regions, and visualizing spatial and temporal patterns in climate variables.

## Overview
#### 1. Ass_2_Ipadeola_Stephen_MCS_18_6335.R:                 
* This script processes precipitation data from a NetCDF file (v2p0chirps_25_monSum.nc).
* It extracts precipitation, longitude, latitude, and time variables.
* The script calculates seasonal averages and visualizes the data for the African continent.
* Spatial maps of precipitation data are plotted for different seasons.

#### 2. Ipadeola_Stephen_MCS_18_6335.R: 
* This script analyzes temperature data from another NetCDF file (ERA5SfcTMinMax_mon_19810101-20191231.nc).
* It extracts maximum temperature data along with spatial and temporal dimensions.
* The script restructures the data, aggregates temperature by time, and calculates anomalies.
* It includes visualizations such as time series plots of temperature anomalies for 1981-2010.

## Dependencies
Both scripts require the following R packages:
* 'ncdf4': To work with NetCDF files.
* 'ncdf4'.helpers: To assist with handling and processing NetCDF data.
  
Ensure these packages are installed before running the scripts:

    install.packages("ncdf4")
    install.packages("ncdf4.helpers")

## Running the Scripts
#### 1. Ass_2_Ipadeola_Stephen_MCS_18_6335.R:
* Update the script with the correct path to the NetCDF file if needed.
* Run the script in an R environment to process and visualize precipitation data for Africa.

#### 2. Ipadeola_Stephen_MCS_18_6335.R:
* Set your working directory to the location of the NetCDF file by modifying the 'setwd()' function.
* Execute the script to analyze temperature data, restructure it, and visualize temperature anomalies.

## Data Files
* 'v2p0chirps_25_monSum.nc': NetCDF file containing precipitation data.
* 'ERA5SfcTMinMax_mon_19810101-20191231.nc': NetCDF file containing temperature data.

Ensure the NetCDF files are available in the appropriate directories before running the scripts.

## Outputs
* Seasonal spatial maps for precipitation data.
* Time series plots for maximum temperature anomalies.

## License
This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments
Special thanks to the climate data providers and the developers of the R packages used in this analysis.

