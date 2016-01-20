## set up selection variables
importFile <- "household_power_consumption.txt"
dateformat <- "%d/%m/%Y %H:%M:%S"
datesNeeded <- c("1/2/2007","2/2/2007")

## import csv to data frame
tempdata <- read.csv(importFile,
                     sep = ";",
                     stringsAsFactors = FALSE)

## filter to required dates
tempdata <- tempdata[tempdata$Date %in% datesNeeded,]

## add date and time and store in the time column
tempdata$Time <- as.POSIXct(paste(tempdata$Date,tempdata$Time), format = dateformat)

## convert other columns to numeric
numerical_cols <- 3:9
for(col in numerical_cols){
        tempdata[,col] <- as.numeric(tempdata[,col])
}

plot(x = tempdata$Time,
     y = tempdata$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

dev.copy(png, "plot2.png")
dev.off()
