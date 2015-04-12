# Plot 2

colNames = c("Date","Time","Global_active_power","Global_reactive_power","Voltage",
             "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

data <- read.table("household_power_consumption.txt", na.strings="?", col.names=colNames,
                   skip=66637, nrows=2881, sep=";", stringsAsFactors = FALSE)
rm(colNames)

data$Date <- as.Date(data$Date, "%d/%m/%Y")
data$DateTime <- paste(data$Date, data$Time)
data$DateTime <- strptime(data$DateTime, "%Y-%m-%d %H:%M:%S")
data <- data[,c(10,1:9)]

png("plot2.png")
plot(data$DateTime, data$Global_active_power, type="n",
     xlab="", ylab="Global Active Power (kilowatts)")
lines(data$DateTime, data$Global_active_power)
dev.off()
