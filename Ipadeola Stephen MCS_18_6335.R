rm(list = ls())
library(ncdf4)
library(ncdf4.helpers)
setwd("C:/Users/USER/Documents/Projects/R_Projects/Ipadeola_Stephen_MCS_18_6335/MCS_507")
nc3 <- nc_open("ERA5SfcTMinMax_mon_19810101-20191231.nc")
nc3


###read data variables
tmax <- ncvar_get( nc3, "tmax" )
lon <- ncvar_get( nc3, "lon" )
lat <- ncvar_get( nc3, "lat" )
tim <- ncvar_get( nc3, "time" )
tims <- nc.get.time.series(nc3) #This function requires "ncdf4.helpers"
#package
head(tims)
tmax

nc_close(nc3) ##close data file
##print variable dimension
dim(tim); dim(lon); dim(lat); dim(tmax) #note the data structure

##print lon and lat
"LON"; print(lon); "LAT"; print(lat)

##restructure the data
lon2 = lon#-180;
lat2 = rev(lat)
lat2

##print new LON and LAT
"LON2"; print(lon2); "LAT2"; print(lat2)

tmaxN <- tmax[ , ncol(tmax):1 , ] #Reverse the lat/col

##Define longitude and latitude corners for Nigeria
maxlon <- 15
minlon <- 2
maxlat <- 15
minlat <- 2


##To subset time
library(PCICt)
library(lubridate)


mintime <- as.PCICt("1981-01-01", cal="proleptic_gregorian")
maxtime <- as.PCICt("2010-12-31", cal="proleptic_gregorian")
##Subset lon, lat and time for a region
idxlon <- which( lon2>= minlon & lon2 <= maxlon )
idxlat <- which( lat2>= minlat & lat2 <= maxlat )
idxtime <- which( tims>= mintime &
                    tims <= maxtime)
##Subset lon, lat and time for a specific site
slon = 5; slat = 7
idxlonS <- which( abs(lon2 - slon) == min(abs(lon2 - slon)))
idxlatS <- which( abs(lat2 - slat) == min(abs(lat2 - slat)))
#--split time
year = format(tims, format = "%Y")
month = format(tims, format = "%m")
day = format(tims, format = "%d")
hour = format(tims, format = "%H")
minute = format(tims, format = "%M")
second = format(tims, format = "%S")
idxtimeM <- which( tims>= mintime &
                     tims <= maxtime & month(tims)==5) # Extracting for only May


#--subset for a region
Tmax <- tmaxN[idxlon, idxlat, ]
llon <- lon2[idxlon]
llat <- lat2[idxlat]
tims2 = tims[idxtime]
tims3 = tims[idxtimeM]
#--subset for a specific site
TmaxS <- tmaxN[idxlonS, idxlatS, idxtime]
tmax.n <- tmaxN[idxlon, idxlat, idxtime]
dim(tmax.n)



tmax.mn <- apply(tmax.n, 3, mean) #--domain average
tmax.mn2 <- apply(tmax.n, c(1,2), mean) #--time average
dim(tmax.mn2)


#--aggregate data by time
tmax.ts <- aggregate(tmax.mn, by=list(year(tims2)), FUN="mean") #--year mean
tmax.ts
tmax.ts.mon <- aggregate(tmax.mn, by=list(month(tims2)), FUN="mean") #--monthly mean
overall_mean <- mean(tmax.mn, by=list(year(tims2)), FUN="mean")
overall_mean
tmax_anomaly <- tmax.ts$x - overall_mean
tmax_anomaly
plot(tmax_anomaly, type = "l", xlab="Year", ylab=expression("Maximum Temperature ("*~degree*C*")"))




# Subset tmax_anomaly for the years 1981-2010
tmax_anomaly_sub <- tmax_anomaly[1:30]  # Assuming 30 years from 1981 to 2010

# Create a sequence of years from 1981 to 2010
years <- seq(1981, 2010)

# Plot tmax_anomaly for the years 1981-2010
plot(years, tmax_anomaly_sub, type = "l", col = "red", xlab = "Year", 
     ylab = expression("Temperature Anomaly ( "*degree*C*")"),
     main = "2-meter Maximum Surface Temperature Anomaly (1981-2010)")


mean_anomaly <- mean(tmax_anomaly_sub)

# Add the mean temperature anomaly line
abline(h = mean_anomaly, col = "grey", lty = 4)

