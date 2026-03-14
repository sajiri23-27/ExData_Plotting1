# Read dataset
data <- read.table("household_power_consumption.txt",
                   header = TRUE,
                   sep = ";",
                   na.strings = "?")

# Convert Date column
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# Filter required dates
subset_data <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

# Create Date-Time column
subset_data$Datetime <- strptime(paste(subset_data$Date, subset_data$Time),
                                 "%Y-%m-%d %H:%M:%S")

# Create PNG
png("plot2.png", width = 480, height = 480)

# Plot line graph
plot(subset_data$Datetime,
     subset_data$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

# Close device
dev.off()


