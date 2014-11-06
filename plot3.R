# The file has been loaded to my local disc for the required dates
# Read the file into R
setwd("C:/Users/Frank/Documents/R/Exdata")
file <- "household_power_consumption.txt"
power <- read.csv(file,sep=";",header=T)
#Set label for plot 3
tp1 <- "Global Active Power"
xlab1 <- "Global Active Power (kilowatts)"
ylab3 <- "Energy sub metering"

#Set variable names
v_gap <- power$Global_active_power
v_grp <- power$Global_reactive_power
v_volt <- power$Voltage
v_sm1 <- power$Sub_metering_1
v_sm2 <- power$Sub_metering_2
v_sm3 <- power$Sub_metering_3
v_dt <- power$dt

# Create date time object
dt <- paste(power$Date, power$Time)
v_dt <- strptime(dt, "%d/%m/%Y %H:%M:%S")

# Generate Plot 3
png(filename = "plot3.png",width = 480, height = 480)
rd <- range(0,40)
plot(v_dt,v_sm2,type = "l",ylab = ylab3, xlab = "",lwd = 2,ylim = rd,col="red")
par(new=T)
plot(v_dt,v_sm3,type = "l",ylab = "", xlab = "",lwd = 2,ylim = rd,col="blue")
par(new=T)
plot(v_dt,v_sm1,type = "l",ylab = "", xlab = "",lwd = 2,ylim=rd)
par(new=F)
clr <- c(1,2,4)
legend("topright", legend = c(l1,l2,l3),lty = 1,col=clr)
dev.off()
