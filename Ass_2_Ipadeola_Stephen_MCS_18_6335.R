library(ncdf4)
library(ncdf4.helpers)

# Read the NetCDF file
nc4 <- nc_open("v2p0chirps_25_monSum.nc")

# Extract necessary variables
precipitation_data <- ncvar_get(nc4, "pr")
lon <- ncvar_get(nc4, "lon")
lat <- ncvar_get(nc4, "lat")
time <- ncvar_get(nc4, "time")

# Close the NetCDF file
nc_close(nc4)

# Convert time values to dates
dates <- as.Date("1981-01-01") + time

# Calculate seasonal averages
seasonal_avg <- apply(precipitation_data, c(1, 2), function(x) tapply(x, as.factor(format(dates, "%m")), mean))

# Subset data for Africa (assuming lon from -20 to 55 and lat from -35 to 37)
lon_idx <- which(lon >= -19 & lon <= 55)
lat_idx <- which(lat >= -39 & lat <= 40)
africa_precip <- seasonal_avg[lon_idx, lat_idx, ]

# Plot spatial maps
par(mfrow = c(2, 2))
seasons <- c("DJF", "MAM", "JJA", "SON")
for (i in 1:4) {
  image(lon[lon_idx], lat[lat_idx], africa_precip[, , i], col = rev(terrain.colors(10)),
        xlab = "Longitude", ylab = "Latitude", main = seasons[i])
}

# Choose the time slice you want to visualize (e.g., first time step)
time_slice <- 1

# Plot spatial map of precipitation
image(lon, lat, precipitation_data[, , time_slice], col = terrain.colors(10),
      xlab = "Longitude", ylab = "Latitude", main = "Precipitation Map")
