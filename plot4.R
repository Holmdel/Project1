# The 'household_power_consumption' file has been loaded to my local disc for the required dates.
# Read the file into R
setwd("C:/Users/Frank/Documents/R/Exdata")
file <- "household_power_consumption.txt"
power <- read.csv(file,sep=";",header=T)
#Set labels for plot 4
tp1 <- "Global Active Power"
ylab2 <- "Global Active Power"
ylab3 <- "Energy sub metering"
ylab4 <- "Global_reactive_power"
#Set variable names to be used in generating plots
v_gap <- power$Global_active_power
v_grp <- power$Global_reactive_power
v_volt <- power$Voltage
v_sm1 <- power$Sub_metering_1
v_sm2 <- power$Sub_metering_2
v_sm3 <- power$Sub_metering_3
v_dt <- power$dt

l1 <- "Sub_metering_1"
l2 <- "Sub_metering_2"
l3 <- "Sub_metering_3"

#set datetime object
dt <- paste(power$Date, power$Time)
v_dt <- strptime(dt, "%d/%m/%Y %H:%M:%S")

#Generate Plot 4

png(filename = "plot4.png",width = 480, height = 480)
par(mfcol = c(2,2),new=F)  #By column by row
plot(v_dt,v_gap,type = "l",ylab = ylab2, xlab = "",lwd = 2)

rd <- range(0,40)
plot(v_dt,v_sm2,type = "l",ylab = "energy", xlab = "",lwd = 2,ylim = rd,col="red")
par(new=T)
plot(v_dt,v_sm3,type = "l",ylab = "", xlab = "",lwd = 2,ylim = rd,col="blue")
par(new=T)
plot(v_dt,v_sm1,type = "l",ylab = "", xlab = "",lwd = 2,ylim=rd)
clr <- c(1,2,4)
legend("topright", legend = c(l1,l2,l3),lty = 1,col=clr)

par(new=F)
plot(v_dt,v_volt,type = "l",ylab = "Voltage", xlab = "datetime",lwd = 1)

plot(v_dt,v_grp,type = "l",ylab = ylab4, xlab = "datetime",lwd = 1)
dev.off()
