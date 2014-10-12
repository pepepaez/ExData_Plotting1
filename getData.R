getData <- function(){
     
     ## Check if a file with subset of data already exists
     if(file.exists("./data/data_subset.txt")){
          data <- read.table("./data/data_subset.txt", header=T, colClasses =c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
          data$Date <- strptime(data$Date, "%Y-%m-%d")
     }else{
          if(!file.exists("./data/household_power_consumption.txt")){
               ## Download data
               url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
               download.file(url, "./data/data.zip", method = "curl")
               
               unzip("./data/data.zip", exdir = "./data")
          }
          
          ## Read data
          data <- read.table("./data/household_power_consumption.txt", sep=";", header=T, colClasses =c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"), na.strings="?")
          data$Date <- strptime(data$Date, "%d/%m/%Y")
          
          ## Subset only to the days we need (2007-02-01 & 2007-02-02)
          data <- subset(data, as.Date(Date)>= as.Date("2007-02-01") & as.Date(Date)<= as.Date("2007-02-02"))
          
          ## Save subset for next time we need the data
          write.table(data, file="./data/data_subset.txt", row.name=F)     
     }
     
     return(data)
}

