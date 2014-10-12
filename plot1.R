## Source additional function to get data
source("getData.R")

## Load data
data <- getData()

## Create device with appropriate dimensions
png("plot1.png", height=480, width=480)

## Create histogram for plot1
with(data, hist(Global_active_power, col= "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power"))

## Copy to file & close
## dev.copy(png,file="plot1.png")
dev.off()
