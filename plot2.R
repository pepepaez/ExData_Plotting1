## Source additional function to get data
source("getData.R")

## Load data
data <- getData()

## Set DateTime variable for time series plot
data$DateTime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

## Create device with appropriate dimensions
png("plot2.png", height=480, width=480)

## Create time series for plot2
with(data, {plot(DateTime, Global_active_power, pch=NA, 
                 xlab="", ylab="Global Active Power (kilowatts)")
            lines(DateTime, Global_active_power)})

## Copy to file & close
## dev.copy(png,file="plot2.png") # Also possible to copy from screen to PNG file
dev.off()
