## Source additional function to get data
source("getData.R")

## Load data
data <- getData()

## Set DateTime variable for time series plot
data$DateTime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

## Create device with appropriate dimensions
png("plot4.png", height=480, width=480)
par(mfrow=c(2,2))

## Create time series for plot2
with(data, {plot(DateTime, Global_active_power,pch=NA,xlab="",ylab="Global Active Power")
lines(DateTime, Global_active_power)
plot(DateTime, Voltage, pch=NA)
lines(DateTime, Voltage)
plot(DateTime, Sub_metering_1,pch=NA, xlab="", ylab="Energy sub metering")
lines(DateTime, Sub_metering_1)
lines(DateTime, Sub_metering_2, col="red")
lines(DateTime, Sub_metering_3, col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty= c(1,1,1), col=c("black", "red", "blue"))
plot(DateTime, Global_reactive_power, pch=NA)
lines(DateTime, Global_reactive_power)})

## close
dev.off()
