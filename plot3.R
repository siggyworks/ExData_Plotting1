## Project 1 Assignment: Exploratory Data Analysis (plot3.R)

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

## Create the plot:  Line graph of Submetering 1, 2 and 3
png(file="plot3.png", width=480, height=480, bg="transparent")
plot(poweruse$DateTime,
     poweruse$Sub_metering_1, 
     ylab = "Energy sub metering", 
     type="l", 
     xlab=NA)
lines(poweruse$DateTime,poweruse$Sub_metering_2, col="blue",type="l")
lines(poweruse$DateTime,poweruse$Sub_metering_3, col="red",type="l")
legend("topright",
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col=c("black","blue","red"),
       lty=1)
dev.off()
