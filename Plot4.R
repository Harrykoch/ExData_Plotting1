#
#
#
setwd("~/Desktop/Coursera - Exploratory data analysis")

hh_power <- read.csv("household_power_consumption.txt", sep=";",na.strings=c("NA","?"))
x<-hh_power$Date=="1/2/2007" | hh_power$Date=="2/2/2007"
hhpwc<-hh_power[x,]
rm(hh_power)
rm(x)
hhpwc$dt<-as.POSIXct(paste(as.character(hhpwc$Date),as.character(hhpwc$Time)), format = "%d/%m/%Y %H:%M") 

# Plot 4
#================
#
# 1. Use the results from producing plot 1 and 2 and 3. 
# 2. Set the number of plots to be produced per row and column
# 3. Create the first plot (this is plot 2)
# 4. Create the second plot (Similar to plot 2 but different variable)
# 5. Create third plot (this is plot 3)
# 6. Plot the last plot (this is a variant on plot 2)
# 7. Save the plot
par(mfrow=c(2,2))

plot(hhpwc$dt,hhpwc$Global_active_power,type="l", ylab="Global Active Power",xlab="")
plot(hhpwc$dt,hhpwc$Voltage,type="l", ylab="Voltage",xlab="datetime")
with(hhpwc,{
  plot(dt, Sub_metering_1, type="n",ylab="Energy sub metering",xlab="")    # No data in the plot
  lines(dt,Sub_metering_1,type="l",col="black")
  lines(dt,Sub_metering_2,type="l",col="red")
  lines(dt,Sub_metering_3,type="l",col="blue")
  legend("topright", legend=legtxt, col=legcol, lwd=1, lty=leglty,y.intersp=1,xjust=1)
})
plot(hhpwc$dt,hhpwc$Global_reactive_power,type="l", ylab="Global_reactive_power",xlab="datetime")

dev.copy(png, "plot4.png")
dev.off()