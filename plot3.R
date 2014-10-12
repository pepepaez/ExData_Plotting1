## Source additional function to get data
source("getData.R")

## Load data
data <- getData()

## Set DateTime variable for time series plot
data$DateTime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

## Create device with appropriate dimensions
png("plot3.png", height=480, width=480)

## Create time series for plot2
with(data, {plot(DateTime, Sub_metering_1, pch=NA,
                 xlab="", ylab="Energy sub metering")
            lines(DateTime, Sub_metering_1, col="black")
            lines(DateTime, Sub_metering_2, col="red")
            lines(DateTime, Sub_metering_3, col="blue")})

legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty= c(1,1,1), col=c("black", "red", "blue"))
## close
dev.off()