#import the data
data<-read.csv("household_power_consumption.txt", sep=";", colClasses="character")

#process the data
data<-data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]
data$Global_active_power<-as.numeric(data$Global_active_power)
data$time<-paste(data$Date, data$Time, sep=" ")
data$time<-strptime(data$time, format="%d/%m/%Y %H:%M:%S")

#open a png device, plot, and close the png device
png(filename="plot2.png", width=480, height=480, units="px")

plot(data$time, data$Global_active_power, type="n", ylab="Global Active Power (kilowatts)", xlab="")
lines(data$time, data$Global_active_power, type="l")

dev.off()
