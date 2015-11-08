dat <- read.table("~/datasciencecoursera/data/household_power_consumption.txt", sep=";", header=T, na.strings = "?")

my_dat <- dat[dat$Date=="1/2/2007" | dat$Date == "2/2/2007", ]

my_dat$datetime <- strptime(paste(my_dat$Date, my_dat$Time), format="%d/%m/%Y %H:%M:%S")

my_dat$Global_active_power <- as.numeric(as.character(my_dat$Global_active_power))
plot(my_dat$datetime, my_dat$Global_active_power, type="l", xlab="", 
     ylab="Global Active Power (kilowatts)")

dev.copy(png,file="plot2.png")
dev.off()
