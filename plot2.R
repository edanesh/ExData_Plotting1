#load required libraries
library(data.table)
library(lubridate)

#read data set and subset selected dates
df <- fread("household_power_consumption.txt", na.strings = "?")
datetime <- paste(df$Date, df$Time)
df$datetime <- dmy_hms(datetime)
dfs <- subset(df, datetime >= as.POSIXct("2007-02-01") & datetime < as.POSIXct("2007-02-03"))

#plot 2
x <- dfs$datetime; y2 <- dfs$Global_active_power
par(mfrow=c(1,1), mar=c(5,4,4,2)+0.1, bg = NA)
plot(x,dfs$Global_active_power, "l", xlab = "", ylab = "Global Active Power (kilowatts)")

#create png file
dev.copy(png, "plot2.png", width=480,height=480)
dev.off()