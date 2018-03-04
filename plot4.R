#load required libraries
library(data.table)
library(lubridate)

#read data set and subset selected dates
df <- fread("household_power_consumption.txt", na.strings = "?")
datetime <- paste(df$Date, df$Time)
df$datetime <- dmy_hms(datetime)
dfs <- subset(df, datetime >= as.POSIXct("2007-02-01") & datetime < as.POSIXct("2007-02-03"))

#plot 4
x <- dfs$datetime; y2 <- dfs$Global_active_power
par(mfrow=c(2,2), mar = c(6,6,2,1), bg = NA)
plot(x2, y2, "l", xlab = "", ylab = "Global Active Power")
plot(x2, dfs$Voltage, "l", xlab = "datetime", ylab = "Voltage")
plot(x2,dfs$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(x2, dfs$Sub_metering_1)
lines(x2, dfs$Sub_metering_2, col = "red")
lines(x2, dfs$Sub_metering_3, col = "blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col= c("black","red","blue"), lty = c(1,1,1), bty ="n")
plot(x2, dfs$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="l")

#create png file
dev.copy(png, "plot4.png", width=480,height=480)
dev.off()