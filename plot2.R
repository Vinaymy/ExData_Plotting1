par(mfrow=c(1, 1))
my_data <- read.csv("eda/ExData_Plotting1/household_power_consumption.txt", header = TRUE, sep = ";", dec = ".")
my_data$Date <- as.Date((my_data$Date), format = "%m/%d/%Y")
my_data <- my_data[my_data$Date >= "2007-02-01" & my_data$Date <= "2007-02-02",]
my_data$Global_active_power <- as.numeric(as.character(my_data$Global_active_power))
my_data$DateTime = as.POSIXct(paste(my_data$Date, my_data$Time), format="%Y-%m-%d %H:%M:%S")

png('plot2.png')
plot(my_data$Global_active_power~my_data$DateTime, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()