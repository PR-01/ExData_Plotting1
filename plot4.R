library(utils)
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
subdata <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

DayAndTime <- strptime(paste(subdata$Date, subdata$Time, sep = " "), "%d/%m/%Y %H:%M:%S") 
GAP <- as.numeric(subdata$Global_active_power)
SM1 <- as.numeric(subdata$Sub_metering_1)
SM2 <- as.numeric(subdata$Sub_metering_2)
SM3 <- as.numeric(subdata$Sub_metering_3)
Volt <- as.numeric(subdata$Voltage)
GRP <- as.numeric(subdata$Global_reactive_power)

png("plot4.png")
par(mfcol = c(2,2))
plot(DayAndTime, GAP, type = "l", xlab = "", ylab = "Global Active Power")

plot(DayAndTime, SM1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(DayAndTime, SM1, type = "l")
lines(DayAndTime, SM2, type = "l", col = "red")
lines(DayAndTime, SM3, type = "l", col = "blue")
legend("topright", cex = 0.9, bty = "n", legend = c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"), lty = 1, col = c("black", "red", "blue"))

plot(DayAndTime, Volt, type = "l", xlab = "datetime", ylab = "Voltage")

plot(DayAndTime, GRP, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()