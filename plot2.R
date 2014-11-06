# The 'household_power_consumption' file has been loaded to my local disc for the required dates.
# Read the file into R
setwd("C:/Users/Frank/Documents/R/Exdata")
file <- "household_power_consumption.txt"
power <- read.csv(file,sep=";",header=T)
#Set label for plot 2
tp1 <- "Global Active Power"
ylab1 <- "Global Active Power (kilowatts)"
#Set variable names to be used in generating plots
v_gap <- power$Global_active_power
v_grp <- power$Global_reactive_power
v_volt <- power$Voltage
v_sm1 <- power$Sub_metering_1
v_sm2 <- power$Sub_metering_2
v_sm3 <- power$Sub_metering_3
v_dt <- power$dt

# Generate Plot 2
# Create date time object
dt <- paste(power$Date, power$Time)
v_dt <- strptime(dt, "%d/%m/%Y %H:%M:%S")

png(filename = "plot2.png",width = 480, height = 480)
plot(v_dt,v_gap,type = "l",ylab = ylab1, xlab = "",lwd = 2)
dev.off()