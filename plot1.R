# Data Exploratory Analysis - Coursera
# Project 1 - Plot 1

# The dataset has 2,075,259 rows and 9 columns.
epc <- read.table("household_power_consumption.txt", header=TRUE, sep=";")

# We will only be using data from the dates 2007-02-01 and 2007-02-02.
epcdata <- epc[epc$Date %in% c("1/2/2007", "2/2/2007") , ]
rm(epc) # cleaning the memory

epcdata$Global_active_power <- as.numeric(levels(epcdata$Global_active_power))[epcdata$Global_active_power]

# Histograma 1
col <- "red"
xlab <- "Global Active Power (kilowatts)"
main <- "Global Active Power"

png(file = "plot1.png", width = 480, height = 480, units = "px")
hist(epcdata$Global_active_power, col=col, xlab=xlab, main=main, cex.axis=1.0, cex.lab=1.0)
dev.off()

