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
png("plot2.png", width = 480, height = 480)

# Plot
plot(
  data$Datetime,
  data$Global_active_power,
  type = "l",
  xlab = "",
  ylab = "Global Active Power (kilowatts)"
)

# Close
dev.off()