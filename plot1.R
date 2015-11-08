dat <- read.table("~/datasciencecoursera/data/household_power_consumption.txt",  sep=";", header=T)

my_dat <- dat[dat$Date=="1/2/2007" | dat$Date == "2/2/2007", ]

my_dat$Global_active_power <- as.numeric(as.character(my_dat$Global_active_power))
hist(my_dat$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", 
     main="Global Active Power")

dev.copy(png,file="plot1.png")
dev.off()
