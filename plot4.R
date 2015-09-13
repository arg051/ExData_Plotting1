## reading file
fullData <- read.table("household_power_consumption.txt", header=TRUE, sep=";",  na.strings = "?", stringsAsFactors = FALSE)

## subsetting data and creating datetime variable 
workData <- subset(fullData, fullData$Date == "1/2/2007" | fullData$Date == "2/2/2007")
workData$datetime <- paste(workData$Date, workData$Time, sep=" ") 
workData$datetime <- as.POSIXct(strptime(workData$datetime, format="%d/%m/%Y %H:%M:%S"))




par(mfrow=c(2,2))


## create plot 1 
plot(workData$datetime, workData$Global_active_power, type="l", xlab="", ylab="Global Active Power")


## create plot 2 
with(workData, plot(datetime, Voltage, type="l"))



## create plot 3 
plot(workData$datetime, workData$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
points(workData$datetime,workData$Sub_metering_2, type="l", col="red")
points(workData$datetime,workData$Sub_metering_3, type="l", col="blue")
legend("topright",   lty = 1, col=c("black","blue","red"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n", cex=0.6)


## create plot 4 
with(workData, plot(datetime, Global_reactive_power, type="l"))


## create png file
dev.copy(png, file="plot4.png")
dev.off()