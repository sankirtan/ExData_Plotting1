## Reading dataset
consumption <- read.table("./exploratoryCourse4Week1/household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".", na.strings = "?")
consumption$Date <- as.Date(consumption$Date, format = "%d/%m/%Y")
finaldata <- subset(consumption, Date >= "2007-02-01" & Date <= "2007-02-02")
dim(finaldata)

##Concatenating Date and Time
dateTime <- paste(as.Date(finaldata$Date), finaldata$Time)
dateTime <- as.POSIXct(dateTime)

##Saving plot2
plot(dateTime, finaldata$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
dev.copy(png, file = "Plot2.png", height = 480, width = 480)
dev.off()
