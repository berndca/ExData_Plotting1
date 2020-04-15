library(dplyr)

df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?",
                 colClasses = c("character", "character", rep("numeric", 7)))
dfd <- mutate(df, Time = as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S"))
df2 <- filter(dfd, Time >= as.POSIXct("2007-02-01") & Time < as.POSIXct("2007-02-03"))

png(filename = "plot3.png")
with(df2, {
    plot(Time, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
    lines(Time, Sub_metering_2 , type = "l", col = "red")
    lines(Time, Sub_metering_3 , type = "l", col = "blue")
    legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           col=c("black", "red", "blue"), lty = 1)
  }
)
dev.off()
