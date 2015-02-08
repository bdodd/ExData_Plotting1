#import the data
data<-read.csv("household_power_consumption.txt", sep=";", colClasses="character")

#process the data
data<-data[data$Date=="1/2/2007" | data$Date=="2/2/2007",]
data$Global_active_power<-as.numeric(data$Global_active_power)
data$Global_reactive_power<-as.numeric(data$Global_reactive_power)
data$Sub_metering_1<-as.numeric(data$Sub_metering_1)
data$Sub_metering_2<-as.numeric(data$Sub_metering_2)
data$Sub_metering_3<-as.numeric(data$Sub_metering_3)
data$Voltage<-as.numeric(data$Voltage)
data$time<-paste(data$Date, data$Time, sep=" ")
data$time<-strptime(data$time, format="%d/%m/%Y %H:%M:%S")

#open a png device, plot, and close the png device
png(filename="plot4.png", width=480, height=480, units="px")

par(mfrow=c(2,2))

plot(data$time, data$Global_active_power, type="n", ylab="Global Active Power", xlab="")
lines(data$time, data$Global_active_power, type="l")

plot(data$time, data$Voltage, type="n", ylab="Voltage", xlab="datetime")
lines(data$time, data$Voltage, type="l")

plot(data$time, data$Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")
lines(data$time, data$Sub_metering_1, type="l", col="black")
lines(data$time, data$Sub_metering_2, type="l", col="red")
lines(data$time, data$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1, bty="n")

plot(data$time, data$Global_reactive_power, type="n", xlab="datetime", ylab="Global_reactive_power")
lines(data$time, data$Global_reactive_power, type="l")

dev.off()
