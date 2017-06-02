## Reading dataset
consumption <- read.table("./exploratoryCourse4Week1/household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".", na.strings = "?")
##Converting to date format
consumption$Date <- as.Date(consumption$Date, format = "%d/%m/%Y")

##Subsetting as per the required dates
finaldata <- subset(consumption, Date >= "2007-02-01" & Date <= "2007-02-02")
dim(finaldata)

##Concatenating Date and Time
dateTime <- paste(as.Date(finaldata$Date), finaldata$Time)
dateTime <- as.POSIXct(dateTime)

##Creating the Histogram Plot1
hist(finaldata$Global_active_power, col = "red", xlab = "Global Active Power(Kilowatts)", main = "Global Active Power")

##Saving the png file
dev.copy(png, file = "Plot1.png", height = 480, width = 480)
dev.off()
