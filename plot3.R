## reading file
fullData <- read.table("household_power_consumption.txt", header=TRUE, sep=";",  na.strings = "?", stringsAsFactors = FALSE)

## subsetting data and creating datetime variable 
workData <- subset(fullData, fullData$Date == "1/2/2007" | fullData$Date == "2/2/2007")
workData$datetime <- paste(workData$Date, workData$Time, sep=" ") 
workData$datetime <- as.POSIXct(strptime(workData$datetime, format="%d/%m/%Y %H:%M:%S"))



## create graph 
plot(workData$datetime, workData$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
points(workData$datetime,workData$Sub_metering_2, type="l", col="red")
points(workData$datetime,workData$Sub_metering_3, type="l", col="blue")
legend("topright",   lty = 1, col=c("black","blue","red"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.8)




## create png file
dev.copy(png, file="plot3.png")
dev.off()