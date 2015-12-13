#importing the data
data <- read.table("./Data/household_power_consumption.txt", header=T, sep=";", stringsAsFactors=FALSE, dec=".")

#subsetting the data
subset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#making the plot and saving the file
datetime <- strptime(paste(subset$Date, subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subset$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
