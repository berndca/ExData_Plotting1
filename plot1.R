library(dplyr)

df <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?",
                 colClasses = c("character", "character", rep("numeric", 7)))
dfd <- mutate(df, Date = as.Date(Date, format = "%d/%m/%Y"))
df2 <- filter(dfd, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))

png(filename = "plot1.png")
hist(df2$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()
