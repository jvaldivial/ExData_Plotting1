# Data Exploratory Analysis - Coursera
# Project 1 - Plot 3

# The dataset has 2,075,259 rows and 9 columns.
epc <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

# We will only be using data from the dates 2007-02-01 and 2007-02-02.
epcdata <- epc[epc$Date %in% c("1/2/2007", "2/2/2007") , ]
rm(epc) # cleaning the memory

# You may find it useful to convert the Date and Time variables to Date/Time 
# classes in R using the strptime() and as.Date() functions.
epcdata$datetime <- paste(epcdata$Date, epcdata$Time) # Crear la columna datetime
epcdata$Date <- as.Date(epcdata$Date, format="%d/%m/%Y")
epcdata$datetime <- strptime(epcdata$datetime, format="%d/%m/%Y %H:%M:%S")

# Plot 3
xlab <- NA
ylab <- "Energy sub metering"

png(file = "plot3.png", width = 480, height = 480, units = "px")
with (epcdata, plot(datetime, Sub_metering_1, xlab=xlab, ylab=ylab, type="n")) # Create the canvas without data
with (epcdata, lines(datetime, Sub_metering_1, type="l", col="black"))
with (epcdata, lines(datetime, Sub_metering_2, type="l", col="red"))
with (epcdata, lines(datetime, Sub_metering_3, type="l", col="blue"))
legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

