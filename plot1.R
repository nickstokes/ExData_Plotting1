tempdata <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE)
#tempdata$Date <- as.Date(tempdata$Date, format = "dd/mm/yyyy")
#tempdata$Time <- strptime(tempdata$Time, format = "hh:mm:ss")
numerical_cols <- 3:9
for(col in numerical_cols){tempdata[,col] <- as.numeric(tempdata[,col])}