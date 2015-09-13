## reading file
fullData <- read.table("household_power_consumption.txt", header=TRUE, sep=";",  na.strings = "?", stringsAsFactors = FALSE)

## subsetting data and creating datetime variable 
workData <- subset(fullData, fullData$Date == "1/2/2007" | fullData$Date == "2/2/2007")
workData$datetime <- paste(workData$Date, workData$Time, sep=" ") 
workData$datetime <- as.POSIXct(strptime(workData$datetime, format="%d/%m/%Y %H:%M:%S"))



## create graph 
hist(workData$Global_active_power, main="Global Active Power",  xlab = "Global Active Power (kilowatts)", col="red")

## create png file
dev.copy(png, file="plot1.png")
dev.off()