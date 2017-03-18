# Read in the raw data. Note, it is assumed here that you have downloaded and extracted the raw data file "household_power_consumption.txt" to your R script's working directory.
power_all_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)

# Subset the data to only the data for 1/2/2007 and 2/2/2007.
power <- power_all_data[which(power_all_data$Date == "1/2/2007" | power_all_data$Date == "2/2/2007"),]

# Convert the Global_active_power from a character to numeric variable.
power$Global_active_power <- as.numeric(power$Global_active_power)

# Create and save the plot to a PNG file.
png(file = "plot1.png", width = 480, height = 480)
with(power, hist(Global_active_power, col = "red", xlab = "Global active power (kilowatts)", main = "Global Active Power"))
dev.off()

