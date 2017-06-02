## Reading dataset
consumption <- read.table("./exploratoryCourse4Week1/household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".", na.strings = "?")
consumption$Date <- as.Date(consumption$Date, format = "%d/%m/%Y")
finaldata <- subset(consumption, Date >= "2007-02-01" & Date <= "2007-02-02")
dim(finaldata)

##Concatenating Date and Time
dateTime <- paste(as.Date(finaldata$Date), finaldata$Time)
dateTime <- as.POSIXct(dateTime)

sub1 <- as.numeric(finaldata$Sub_metering_1)
sub2 <- as.numeric(finaldata$Sub_metering_2)
sub3 <- as.numeric(finaldata$Sub_metering_3)

##Plotting the graph
par(mfrow=c(2,2)
plot(dateTime, finaldata$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")
plot(dateTime, finaldata$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(dateTime, sub1, xlab = "",ylab = "Energy Sub Metering", type = "l")
lines(dateTime, sub2, type = "l", col = "red")
lines(dateTime, sub3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black","red","blue"), lty = c(1,1), bty = "n", cex = .5, lwd = 1)
plot(dateTime, finaldata$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global Reactive Power")

#Saving plot4
dev.copy(png, file = "Plot4.png", height = 480, width = 480)
dev.off()
