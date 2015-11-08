# Downloading and unzipping the dataset

url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, destfile="household_power_consumption.zip")
unzip("household_power_consumption.zip")
data <- read.table("household_power_consumption.txt", header=T, sep=";", stringsAsFactors = F)

# Converting character vectors for date and time to Date and Time classes

data$Time <- paste(data$Date, data$Time)
data$Date <- as.Date(strptime(data$Date, format="%d/%m/%Y"))
data$Time <- strptime(data$Time, format="%d/%m/%Y %H:%M:%S")

# Subsetting data (for 2007-02-01 and 2007-02-02)

data <- data[data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02"),]

# plot 3

png("plot3.png", width = 480, height = 480)
plot(data$Time, as.numeric(data$Sub_metering_1), type="l", col="black",
     xlab="",
     ylab="Energy sub metering")
lines(data$Time, as.numeric(data$Sub_metering_2), col="red")
lines(data$Time, as.numeric(data$Sub_metering_3), col="blue")
legend("topright", 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black","red","blue"), lty=1, lwd=1, cex=0.75)
dev.off()