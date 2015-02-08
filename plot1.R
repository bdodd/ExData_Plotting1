#import the data
data<-read.csv("household_power_consumption.txt", sep=";", colClasses="character")

#process the data
data<-data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]
data$Global_active_power<-as.numeric(data$Global_active_power)

#open a png device, plot, and close the png device
png(filename="plot1.png", width=480, height=480, units="px")

hist(data$Global_active_power, breaks=seq(0,8,by=0.5), col="red", axes=FALSE, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
axis(1, at=seq(0,6,by=2))
axis(2, at=seq(0,1200,by=200))

dev.off()
