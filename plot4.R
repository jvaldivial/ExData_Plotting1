# Data Exploratory Analysis - Coursera
# Project 1 - Plot 4

# The dataset has 2,075,259 rows and 9 columns.
epc <- read.table("household_power_consumption.txt", header=TRUE, sep=";")

# We will only be using data from the dates 2007-02-01 and 2007-02-02.
epcdata <- epc[epc$Date %in% c("1/2/2007", "2/2/2007") , ]
rm(epc) # cleaning the memory

# You may find it useful to convert the Date and Time variables to Date/Time 
# classes in R using the strptime() and as.Date() functions.
epcdata$datetime <- paste(epcdata$Date, epcdata$Time) # Crear la columna datetime
epcdata$Date <- as.Date(epcdata$Date, format="%d/%m/%Y")
epcdata$datetime <- strptime(epcdata$datetime, format="%d/%m/%Y %H:%M:%S")

# Note that in this dataset missing values are coded as ?.
# "?" values are in columns 3 to 8
epcdata$Global_active_power <- as.numeric(levels(epcdata$Global_active_power))[epcdata$Global_active_power]
epcdata$Global_reactive_power <- as.numeric(levels(epcdata$Global_reactive_power))[epcdata$Global_reactive_power]
epcdata$Voltage <- as.numeric(levels(epcdata$Voltage))[epcdata$Voltage]
epcdata$Sub_metering_1 <- as.numeric(levels(epcdata$Sub_metering_1))[epcdata$Sub_metering_1]
epcdata$Sub_metering_2 <- as.numeric(levels(epcdata$Sub_metering_2))[epcdata$Sub_metering_2]

png(file = "plot4.png", width = 480, height = 480, units = "px")
par(mfrow = c(2, 2)) # Crea espacio para los 4 graficos
with(epcdata, {
	# Plot Top Left
	xlab <- NA
	ylab <- "Global Active Power"
	plot(datetime, Global_active_power, xlab=xlab, ylab=ylab, type="l")

	# Plot Top Right
	xlab <- "datetime"
	ylab <- "Voltage"
	plot(datetime, Voltage, xlab=xlab, ylab=ylab, type="l")

	# Plot Bottom Left
	xlab <- NA
	ylab <- "Energy sub metering"

	plot(datetime, Sub_metering_1, xlab=xlab, ylab=ylab, type="n")
	lines(datetime, Sub_metering_1, type="l", col="black")
	lines(datetime, Sub_metering_2, type="l", col="red")
	lines(datetime, Sub_metering_3, type="l", col="blue")
	legend("topright", lty=1, bty="n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

	# Plot Bottom Right
	xlab <- "datetime"
	ylab <- "Global_reactive_power"
	plot(datetime, Global_reactive_power, xlab=xlab, ylab=ylab, type="l")
})

dev.off()

