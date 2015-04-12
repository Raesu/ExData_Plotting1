# Plot 4

colNames = c("Date","Time","Global_active_power","Global_reactive_power","Voltage",
             "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

data <- read.table("household_power_consumption.txt", na.strings="?", col.names=colNames,
                   skip=66637, nrows=2881, sep=";", stringsAsFactors = FALSE)
rm(colNames)

data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$DateTime <- paste(data$Date, data$Time)
data$DateTime <- strptime(data$DateTime, "%Y-%m-%d %H:%M:%S")
data <- data[,c(10,1:9)]

png("plot4.png")
par(mfrow=c(2,2))
plot(data$DateTime, data$Global_active_power, type="l", xlab="", ylab="Global Active Power")
plot(data$DateTime, data$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(data$DateTime, data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_2"),
       col=c("black","red","blue"), lty=1)
plot(data$DateTime, data$Global_reactive_power, type="l", xlab="datetime",
     ylab="Global_reactive_power")
dev.off()
