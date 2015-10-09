# Data Exploratory Analysis - Coursera
# Project 1 - Plot 2

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

# Plot 2
xlab <- NA
ylab <- "Global Active Power (kilowatts)"

png(file = "plot2.png", width = 480, height = 480, units = "px")
with (epcdata, plot(datetime, Global_active_power, xlab=xlab, ylab=ylab, type="l"))
dev.off()

