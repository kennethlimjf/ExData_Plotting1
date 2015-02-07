## data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", nrows=1000000, stringsAsFactors=TRUE)
## head(which(data$Date == '1/2/2007')) >> First Row: 66637
## nrows(subset(data, Date == "1/2/2007" | Date == "2/2/2007")) >> Number of Rows: 2880
fileName <- "household_power_consumption.txt"
data <- read.table(fileName, sep=";", na.strings = "?", skip=66637, nrows=2880, stringsAsFactors=TRUE)
headers <- as.character(read.table(fileName, nrows=1, sep=";", stringsAsFactors=F))
colnames(data) <- headers

# Set margins. Set Plot layout. Set graphics device to png.
par(mar=c(4,5,2,1), mfrow=c(2,2))
dev.copy(png, file = "plot4.png")

# Merge Date and time
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

# X-axis labels
x1 <- as.POSIXct("01/02/2007 00:00:00", format="%d/%m/%Y %H:%M:%S")
x2 <- as.POSIXct("02/02/2007 00:00:00", format="%d/%m/%Y %H:%M:%S")
x3 <- as.POSIXct("03/02/2007 00:00:00", format="%d/%m/%Y %H:%M:%S")
x.axis <- c(x1, x2, x3)

# Plot graph 1
plot(data$DateTime, data$Global_active_power, xaxt="n", xlab="", ylab="Global Active Power", type="n")
lines(data$DateTime, data$Global_active_power)
axis.POSIXct(1, at = x.axis, format="%a")

# Plot graph 2
plot(data$DateTime, data$Voltage, xaxt="n", xlab="datetime", ylab="Voltage", type="n")
lines(data$DateTime, data$Voltage)
axis.POSIXct(1, at = x.axis, format="%a")

# Plot graph 3
plot(data$DateTime, data$Sub_metering_1, xaxt="n", xlab="", ylab="Energy sub metering", type="n")
lines(data$DateTime, data$Sub_metering_1, col="darkgreen")
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
axis.POSIXct(1, at = x.axis, format="%a")
legend("topright", pch='', lwd=2, lty=c(1,1,1), col=c("darkgreen", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Plot graph 4
plot(data$DateTime, data$Global_reactive_power, xaxt="n", xlab="datetime", ylab="Global_reactive_power", type="n")
lines(data$DateTime, data$Global_reactive_power)
axis.POSIXct(1, at = x.axis, format="%a")

par(mfrow=c(1,1))
dev.off()