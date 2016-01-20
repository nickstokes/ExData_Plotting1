## set up selection variables
importFile <- "household_power_consumption.txt"
datesNeeded <- c("1/2/2007","2/2/2007")

## import csv to data frame
tempdata <- read.csv(importFile,
                     sep = ";",
                     stringsAsFactors = FALSE)

## filter to required dates
tempdata <- tempdata[tempdata$Date %in% datesNeeded,]

## convert other columns to numeric
numerical_cols <- 3:9
for(col in numerical_cols){
        tempdata[,col] <- as.numeric(tempdata[,col])
}

png(filename = "plot1.png")
hist(tempdata$Global_active_power, 
     col = "red", 
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")

dev.off()
