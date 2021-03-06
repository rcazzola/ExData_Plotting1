#importing the data
data <- read.table("./Data/household_power_consumption.txt", header=T, sep=";", stringsAsFactors=FALSE, dec=".")

#subsetting the data
subset <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#making the plot and saving the file
globalActivePower <- as.numeric(subset$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

