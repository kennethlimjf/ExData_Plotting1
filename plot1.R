## data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", nrows=1000000, stringsAsFactors=TRUE)
## head(which(data$Date == '1/2/2007')) >> First Row: 66637
## nrows(subset(data, Date == "1/2/2007" | Date == "2/2/2007")) >> Number of Rows: 2880
fileName <- "household_power_consumption.txt"
data <- read.table(fileName, sep=";", na.strings = "?", skip=66637, nrows=2880, stringsAsFactors=TRUE)
headers <- as.character(read.table(fileName, nrows=1, sep=";", stringsAsFactors=F))
colnames(data) <- headers

# Set margins. Set graphics device to png.
par(mar=c(6,5.5,4,1), mfrow=c(1,1))
dev.copy(png, file = "plot1.png")

hist(data$Global_active_power, col='red', main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()