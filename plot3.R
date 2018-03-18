#load required libraries
library(data.table)
library(lubridate)

#read data set and subset selected dates
df <- fread("household_power_consumption.txt", na.strings = "?")
datetime <- paste(df$Date, df$Time)
df$datetime <- dmy_hms(datetime)
dfs <- subset(df, datetime >= as.POSIXct("2007-02-01") & datetime < as.POSIXct("2007-02-03"))

#plot 3
x <- dfs$datetime; y2 <- dfs$Global_active_power
par(mfrow=c(1,1), mar=c(5,4,4,2)+0.1, bg = NA)
plot(x,dfs$Sub_metering_1, type = "n", xlab = "", ylab = "Energy sub metering")
lines(x, dfs$Sub_metering_1)
lines(x, dfs$Sub_metering_2, col = "red")
lines(x, dfs$Sub_metering_3, col = "blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col= c("black","red","blue"), lty = c(1,1,1))

#create png file
dev.copy(png, "plot3.png", width=720,height=480)
dev.off()