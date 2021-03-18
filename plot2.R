library(utils)
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
subdata <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

DayAndTime <- strptime(paste(subdata$Date, subdata$Time, sep = " "), "%d/%m/%Y %H:%M:%S") 
GAP <- as.numeric(subdata$Global_active_power)

png("plot2.png")
plot(DayAndTime, GAP, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()