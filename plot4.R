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

png(filename = "plot4.png")

par(mfrow=c(2,2))

plot(x = tempdata$Time,
     y = tempdata$Global_active_power,
     xlab = "",
     ylab = "Global Active Power",
     type = "l")

plot(x = tempdata$Time,
     y = tempdata$Voltage,
     xlab = "datetime",
     ylab = "Voltage",
     type = "l")

plot(x = tempdata$Time,
     y = tempdata$Sub_metering_1,
     type = "l",
     xlab = "",
     ylab = "Energy sub metering")

lines(x = tempdata$Time,
      y = tempdata$Sub_metering_2,
      type="l",
      col = "red")

lines(x = tempdata$Time,
      y = tempdata$Sub_metering_3,
      xlab = "",
      type="l",
      col = "blue")

legend("topright", 
       legend = c("Sub_metering_1",
                  "Sub_metering_2",
                  "Sub_metering_3"),
       lty = 1,
       col = c("black","red", "blue"))

plot(x = tempdata$Time,
     y = tempdata$Global_reactive_power,
     xlab = "datetime",
     type = "l")
        
dev.off()
