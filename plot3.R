#load file
powerdata<-read.table("~\\household_power_consumption.txt", header = TRUE, sep = ";")
powerdata$DateTime<-strptime(paste(powerdata$Date, powerdata$Time, sep=""), format="%d/%m/%Y %H:%M:%S")
work1<- subset(powerdata, Date == "1/2/2007")
work2<- subset(powerdata, Date == "2/2/2007")
work<- rbind(work1,work2)

#Plot - 3
work$Sub_metering_1 <- as.numeric(as.character(work$Sub_metering_1))
work$Sub_metering_2 <- as.numeric(as.character(work$Sub_metering_2))
work$Sub_metering_3 <- as.numeric(as.character(work$Sub_metering_3))

png(filename = "plot3.png", width = 480, height = 480, units = "px")
with(work, plot(DateTime, Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "n"))
with(work, points(DateTime, Sub_metering_1,type="l",  col = "black"))
with(work, points(DateTime, Sub_metering_2,type="l", col = "red"))
with(work, points(DateTime, Sub_metering_3,type="l", col = "blue"))
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off() 