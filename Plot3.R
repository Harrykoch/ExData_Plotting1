#
#
#
setwd("~/Desktop/Coursera - Exploratory data analysis")

hh_power <- read.csv("household_power_consumption.txt", sep=";",na.strings=c("NA","?"))
x<-hh_power$Date=="1/2/2007" | hh_power$Date=="2/2/2007"
hhpwc<-hh_power[x,]
rm(hh_power)
rm(x)

# Plot 3
#================
#
# 1. Use the results from producing plot 1 and 2. 
# 2. Set the text to include in the legend in variable legtxt
# 3. Do the same for the color in variable legcol and linetype in leglty
# 4. Plot the area but don't plot the content
# 5. For the respective sub metering variable plot the line
# 6. Plot the legend
# 7. Save the plot
legtxt<-c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
legcol<-c("black","red","blue")
leglty<-c(1,1,1)

with(hhpwc,{
  plot(dt, Sub_metering_1, type="n",ylab="Energy sub metering")    # No data in the plot
  lines(dt,Sub_metering_1,type="l",col="black")
  lines(dt,Sub_metering_2,type="l",col="red")
  lines(dt,Sub_metering_3,type="l",col="blue")
  legend("topright", legend=legtxt, col=legcol, lwd=1, lty=leglty,y.intersp=1,xjust=1)
})

dev.copy(png, "plot3.png")
dev.off()
