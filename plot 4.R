# Read dataset
data <- read.table("household_power_consumption.txt",
                   header = TRUE,
                   sep = ";",
                   na.strings = "?")

# Convert Date
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# Filter required dates
subset_data <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

# Create Datetime column
subset_data$Datetime <- strptime(paste(subset_data$Date, subset_data$Time),
                                 "%Y-%m-%d %H:%M:%S")

# Create PNG
png("plot4.png", width = 480, height = 480)

# 2x2 layout
par(mfrow = c(2,2))

# Plot 1
plot(subset_data$Datetime,
     subset_data$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power")

# Plot 2
plot(subset_data$Datetime,
     subset_data$Voltage,
     type="l",
     xlab="datetime",
     ylab="Voltage")

# Plot 3
plot(subset_data$Datetime,
     subset_data$Sub_metering_1,
     type="l",
     xlab="",
     ylab="Energy sub metering")

lines(subset_data$Datetime,
      subset_data$Sub_metering_2,
      col="red")

lines(subset_data$Datetime,
      subset_data$Sub_metering_3,
      col="blue")

legend("topright",
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),
       lty=1,
       bty="n")

# Plot 4
plot(subset_data$Datetime,
     subset_data$Global_reactive_power,
     type="l",
     xlab="datetime",
     ylab="Global Reactive Power")

# Close PNG
dev.off()

