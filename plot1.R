# The 'household_power_consumption' file has been loaded to my local disc for the required dates.
# Read the file into R
setwd("C:/Users/Frank/Documents/R/Exdata")
file <- "household_power_consumption.txt"
power <- read.csv(file,sep=";",header=T)
#Set title and label for plot 1
tp1 <- "Global Active Power"
xlab1 <- "Global Active Power (kilowatts)"
#Set variable names to be used in generating plots
v_gap <- power$Global_active_power
v_grp <- power$Global_reactive_power
v_volt <- power$Voltage
v_sm1 <- power$Sub_metering_1
v_sm2 <- power$Sub_metering_2
v_sm3 <- power$Sub_metering_3
v_dt <- power$dt

#Plot 1 is generated using both hist and plot to properly set frequency range.
png(filename = "plot1.png",width = 480, height = 480)
h <-hist(v_gap,col = "red",main = tp1,xlab=xlab1)
plot(h,ylab = "Frequency",col="red",ylim = c(0,1200),xlab = xlab1, main=tp1)
dev.off()