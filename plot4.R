#importing the data
data <- read.table("./Data/household_power_consumption.txt", header=T, sep=";", stringsAsFactors=FALSE, dec=".")

#subsetting the data
subset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#making the plot and saving the file
datetime <- strptime(paste(subset$Date, subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subset$Global_active_power)
globalReactivePower <- as.numeric(subset$Global_reactive_power)
voltage <- as.numeric(subset$Voltage)
submetering1 <- as.numeric(subset$Sub_metering_1)
submetering2 <- as.numeric(subset$Sub_metering_2)
submetering3 <- as.numeric(subset$Sub_metering_3)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, submetering1, type="l", ylab="Energy sub metering", xlab="")
  lines(datetime, submetering2, type="l", col="red")
  lines(datetime, submetering3, type="l", col="blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=1, col=c("black", "red", "blue"), bty="o")
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
