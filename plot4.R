# Read in the raw data. Note, it is assumed here that you have downloaded and extracted the raw data file "household_power_consumption.txt" to your R script's working directory.
power_all_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)

# Subset the data to only the data for 1/2/2007 and 2/2/2007.
power <- power_all_data[which(power_all_data$Date == "1/2/2007" | power_all_data$Date == "2/2/2007"),]

# Concatenate the date and time and store this in a new column DateTime.
power$DateTime <- paste(power$Date, power$Time)
power$DateTime <- strptime(power$DateTime, "%d/%m/%Y %H:%M:%S")

# Convert the Voltage from a character to numeric variable.
power$Voltage <- as.numeric(power$Voltage)

# Convert the Global_active_power from a character to numeric variable.
power$Global_active_power <- as.numeric(power$Global_active_power)

# Convert the Sub_metering character variables to numeric.
power$Sub_metering_1 <- as.numeric(power$Sub_metering_1)
power$Sub_metering_2 <- as.numeric(power$Sub_metering_2)
power$Sub_metering_3 <- as.numeric(power$Sub_metering_3)

# Convert the Global_reactive_power from a character to numeric variable.
power$Global_reactive_power <- as.numeric(power$Global_reactive_power)

# Create and save the plots to a PNG file.
png(file = "plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
plot(power$DateTime,power$Global_active_power,type="l",ylab="Global Active Power",xlab="")
plot(power$DateTime,power$Voltage,type="l",ylab="Voltage",xlab="datetime")
plot(power$DateTime,power$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(power$DateTime,power$Sub_metering_2,col="red")
lines(power$DateTime,power$Sub_metering_3,col="blue")
legend("topright", lty=1, bty="n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(power$DateTime,power$Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")
dev.off()
