colClasses <- c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
dat <- read.table("~/datasciencecoursera/data/household_power_consumption.txt", sep=";", header=T, na.strings = "?", colClasses = colClasses)

my_dat <- dat[dat$Date=="1/2/2007" | dat$Date == "2/2/2007", ]

my_dat$datetime <- strptime(paste(my_dat$Date, my_dat$Time), format="%d/%m/%Y %H:%M:%S")

plot(my_dat$datetime, my_dat$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(my_dat$datetime, my_dat$Sub_metering_2, type="l", col="red")
lines(my_dat$datetime, my_dat$Sub_metering_3, type="l", col="blue")

legends <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
colors <- c("black", "red", "blue")
legend("topright", legend=legends, col=colors, lwd=2)

dev.copy(png,file="plot3.png")
dev.off()