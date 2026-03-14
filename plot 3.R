# Read dataset
data <- read.table("household_power_consumption.txt",
                   header = TRUE,
                   sep = ";",
                   na.strings = "?")

# Convert Date column
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# Filter required dates
subset_data <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

# Create Datetime column
subset_data$Datetime <- strptime(paste(subset_data$Date, subset_data$Time),
                                 "%Y-%m-%d %H:%M:%S")

# Create PNG file
png("plot3.png", width = 480, height = 480)

# First line
plot(subset_data$Datetime,
     subset_data$Sub_metering_1,
     type = "l",
     xlab = "",
     ylab = "Energy sub metering")

# Second line
lines(subset_data$Datetime,
      subset_data$Sub_metering_2,
      col = "red")

# Third line
lines(subset_data$Datetime,
      subset_data$Sub_metering_3,
      col = "blue")

# Legend
legend("topright",
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black","red","blue"),
       lty = 1)

# Close PNG device
dev.off()


