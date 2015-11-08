colClasses <- c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
dat <- read.table("~/datasciencecoursera/data/household_power_consumption.txt", sep=";", header=T, na.strings = "?", colClasses = colClasses)

my_dat <- dat[dat$Date=="1/2/2007" | dat$Date == "2/2/2007", ]

my_dat$datetime <- strptime(paste(my_dat$Date, my_dat$Time), format="%d/%m/%Y %H:%M:%S")

par(mfcol = c(2,2))

plot(my_dat$datetime, my_dat$Global_active_power, type="l", xlab="", ylab="Global Active Power")

plot(my_dat$datetime, my_dat$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(my_dat$datetime, my_dat$Sub_metering_2, type="l", col="red")
lines(my_dat$datetime, my_dat$Sub_metering_3, type="l", col="blue")
legends <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
colors <- c("black", "red", "blue")
legend("topright", legend=legends, col=colors, lwd=1, cex=0.5)

plot(my_dat$datetime, my_dat$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(my_dat$datetime, my_dat$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

# reset par()
par(mfrow=c(1,1))
dev.copy(png,file="plot4.png")
dev.off()

