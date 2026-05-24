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

# Open PNG device
png("plot1.png", width = 480, height = 480)

# Plot histogram
hist(
  data$Global_active_power,
  col = "red",
  main = "Global Active Power",
  xlab = "Global Active Power (kilowatts)"
)

# Close device
dev.off()

