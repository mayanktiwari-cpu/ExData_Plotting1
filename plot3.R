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
png("plot3.png", width = 480, height = 480)

# First line
plot(
  data$Datetime,
  data$Sub_metering_1,
  type = "l",
  xlab = "",
  ylab = "Energy sub metering"
)

# Additional lines
lines(data$Datetime, data$Sub_metering_2, col = "red")
lines(data$Datetime, data$Sub_metering_3, col = "blue")

# Legend
legend(
  "topright",
  lty = 1,
  col = c("black", "red", "blue"),
  legend = c(
    "Sub_metering_1",
    "Sub_metering_2",
    "Sub_metering_3"
  )
)

# Close
dev.off()