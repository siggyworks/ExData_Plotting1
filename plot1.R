## Project 1 Assignment: Exploratory Data Analysis (plot1.R)

## This script reads in the sample datat provided in file ./household_power_consumption.txt

## Read the data
poweruse <- read.table("household_power_consumption.txt", 
                       header=TRUE, sep=";", 
                       skip=66636, nrows=2880, 
                       stringsAsFactors=FALSE, 
                       na.strings="?",
                       quote="")

## Label the columns
names(poweruse) <- c("Date",
                     "Time",
                     "Global_active_power",
                     "Global_reactive_power",
                     "Voltage",
                     "Global_intensity",
                     "Sub_metering_1",
                     "Sub_metering_2",
                     "Sub_metering_3")

## Merge "Date" and "Time" columns and add as another column
poweruse$DateTime <- do.call(paste,poweruse[c("Date","Time")])

## Convert the DateTime column to the right datatype
poweruse$DateTime <- strptime(poweruse$DateTime,"%d/%m/%Y %H:%M:%S")

## Create the plot:  Histogram of Global Active Power
png(file="plot1.png", width=480, height=480, bg="transparent")
hist(poweruse$Global_active_power, 
     breaks=6, 
     main="Global Active Power", 
     xlab = "Global Active Power (kilowatts)", 
     col="red")
dev.off()


