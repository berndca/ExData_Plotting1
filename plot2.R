library(dplyr)

df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?",
                 colClasses = c("character", "character", rep("numeric", 7)))
dfd <- mutate(df, Time = as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S"))
df2 <- filter(dfd, Time >= as.POSIXct("2007-02-01") & Time < as.POSIXct("2007-02-03"))

png(filename = "plot2.png")
with(df2, plot(Time, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()
