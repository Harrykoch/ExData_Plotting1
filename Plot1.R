#
#
#
setwd("~/Desktop/Coursera - Exploratory data analysis")

# Plot 1
#================
#
# 1. Read the dataset into a dataframe
# 2. Determine which rows of the frame are of interest and create a new variable
#    hhpwc (household power consumption) that will be used for the analysis
# 3. Clean up the intermediate variables to release memory
# 4. Create the histogram
# 5. Save the plot

hh_power <- read.csv("household_power_consumption.txt", sep=";",na.strings=c("NA","?"))
x<-hh_power$Date=="1/2/2007" | hh_power$Date=="2/2/2007"
hhpwc<-hh_power[x,]
rm(hh_power)
rm(x)
hist(hhpwc$Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red", ylim=c(0,1200))
dev.copy(png, "plot1.png")
dev.off()
