par(mfrow=c(2,2))

my_data <- read.csv("eda/ExData_Plotting1/household_power_consumption.txt", header = TRUE, sep = ";", dec = ".")
my_data$Date <- as.Date((my_data$Date), format = "%d/%m/%Y")
my_data <- my_data[my_data$Date >= "2007-02-01" & my_data$Date <= "2007-02-02",]
my_data$DateTime = as.POSIXct(paste(my_data$Date, my_data$Time), format="%Y-%m-%d %H:%M:%S")

my_data$Global_active_power <- as.numeric(as.character(my_data$Global_active_power))
my_data$Global_reactive_power <- as.numeric(as.character(my_data$Global_reactive_power))
my_data$Voltage <- as.numeric(as.character(my_data$Voltage))
my_data$Sub_metering_1 <- as.numeric(as.character(my_data$Sub_metering_1))
my_data$Sub_metering_2 <- as.numeric(as.character(my_data$Sub_metering_2))
my_data$Sub_metering_3 <- as.numeric(as.character(my_data$Sub_metering_3))

png('plot4.png')
plot(my_data$Global_active_power~my_data$DateTime, type = "l", ylab="Global Active Power", xlab="")  
plot(my_data$Voltage~my_data$DateTime, type = "l", ylab="Voltage", xlab="")
plot(my_data$Sub_metering_1~my_data$DateTime, type = "l", ylab="Energy sub metering", xlab="")
lines(my_data$Sub_metering_2~my_data$DateTime, type = "l", lty = 2, col = "red") 
lines(my_data$Sub_metering_3~my_data$DateTime, type = "l", lty = 2, col = "blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1, cex=0.75)
plot(my_data$Global_reactive_power~my_data$DateTime, type = "l", ylab="Global Reactive Power", xlab="")
dev.off()