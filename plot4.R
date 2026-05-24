# Read data
data <- read.table(
  "household_power_consumption.txt",
  header = TRUE,
  sep = ";",
  na.strings = "?",
  stringsAsFactors = FALSE
)

# Filter dates
data <- subset(
  data,
  Date == "1/2/2007" | Date == "2/2/2007"
)

# Datetime
data$Datetime <- strptime(
  paste(data$Date, data$Time),
  format = "%d/%m/%Y %H:%M:%S"
)

# PNG
png("plot4.png", width = 480, height = 480)

# 2x2 layout
par(mfrow = c(2,2))

# Plot 1
plot(
  data$Datetime,
  data$Global_active_power,
  type = "l",
  xlab = "",
  ylab = "Global Active Power"
)

# Plot 2
plot(
  data$Datetime,
  data$Voltage,
  type = "l",
  xlab = "datetime",
  ylab = "Voltage"
)

# Plot 3
plot(
  data$Datetime,
  data$Sub_metering_1,
  type = "l",
  xlab = "",
  ylab = "Energy sub metering"
)

lines(data$Datetime, data$Sub_metering_2, col = "red")
lines(data$Datetime, data$Sub_metering_3, col = "blue")

legend(
  "topright",
  lty = 1,
  bty = "n",
  col = c("black", "red", "blue"),
  legend = c(
    "Sub_metering_1",
    "Sub_metering_2",
    "Sub_metering_3"
  )
)

# Plot 4
plot(
  data$Datetime,
  data$Global_reactive_power,
  type = "l",
  xlab = "datetime",
  ylab = "Global_reactive_power"
)

# Close
dev.off()