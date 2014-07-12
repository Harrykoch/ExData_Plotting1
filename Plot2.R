#
#
#
setwd("~/Desktop/Coursera - Exploratory data analysis")

hh_power <- read.csv("household_power_consumption.txt", sep=";",na.strings=c("NA","?"))
x<-hh_power$Date=="1/2/2007" | hh_power$Date=="2/2/2007"
hhpwc<-hh_power[x,]
rm(hh_power)
rm(x)

# Plot 2
#================
#
# 1. Use the results from producing plot 1. Add a new column to the dataframe with a POSIX date forma. hhpwc$dt
# 2. Plot a linechart
# 3. Save the plot
hhpwc$dt<-as.POSIXct(paste(as.character(hhpwc$Date),as.character(hhpwc$Time)), format = "%d/%m/%Y %H:%M") 
plot(hhpwc$dt,hhpwc$Global_active_power,type="l", ylab="Global Active Power (kilowatts)",xlab="")
dev.copy(png, "plot2.png")
dev.off()