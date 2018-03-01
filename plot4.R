# Coursera Exploratory Data Analysis - Project 1
# Marcelo Cardoso

setwd("C:/Users/mmurta/Documents/Coursera/Exploratory Data")

# Rough estimate of memory requirement for a dataset with 2,075,259 rows and 9 columns: 
# 2075259 * 9 * 8 = 0.1425 GB

HsHldPwr <- read.table("~/Coursera/Exploratory Data/household_power_consumption.txt", header = TRUE, sep = ";", colClasses = "character")

HsHldPwr$Date <- as.Date(HsHldPwr$Date, "%d/%m/%Y")
HsHldPwr <- subset(HsHldPwr, (as.Date("2007-01-31") < Date) & (Date < as.Date("2007-02-03")))

HsHldPwr$Time <- strptime(paste(HsHldPwr$Date,HsHldPwr$Time), "%Y-%m-%d %H:%M:%S")
HsHldPwr$Global_active_power <- as.numeric(HsHldPwr$Global_active_power)
HsHldPwr$Global_reactive_power <- as.numeric(HsHldPwr$Global_reactive_power)
HsHldPwr$Voltage <- as.numeric(HsHldPwr$Voltage)
HsHldPwr$Global_intensity <- as.numeric(HsHldPwr$Global_intensity)
HsHldPwr$Sub_metering_1 <- as.numeric(HsHldPwr$Sub_metering_1)
HsHldPwr$Sub_metering_2 <- as.numeric(HsHldPwr$Sub_metering_2)
HsHldPwr$Sub_metering_3 <- as.numeric(HsHldPwr$Sub_metering_3)

# Plot 4
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
# Top left plot
plot(HsHldPwr$Time, HsHldPwr$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kiloWatts)")
# Tob right plot
plot(HsHldPwr$Time, HsHldPwr$Voltage, type = "l", xlab = "", ylab = "Voltage")
# Bottom left plot
plot(HsHldPwr$Time, HsHldPwr$Sub_metering_1, type = "l", xlab = "", ylab = "Energy Sub Metering")
points(HsHldPwr$Time, HsHldPwr$Sub_metering_2, type = "l", col = "red", xlab = "")
points(HsHldPwr$Time, HsHldPwr$Sub_metering_3, type = "l", col = "blue", xlab = "")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty = "n")
# Bottom right plot
plot(HsHldPwr$Time, HsHldPwr$Global_reactive_power, type = "l", xlab = "", ylab = "Global Reactive Power")
dev.off()

