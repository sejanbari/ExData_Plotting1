#load file
powerdata<-read.table("~\\household_power_consumption.txt", header = TRUE, sep = ";")
powerdata$DateTime<-strptime(paste(powerdata$Date, powerdata$Time, sep=""), format="%d/%m/%Y %H:%M:%S")
work1<- subset(powerdata, Date == "1/2/2007")
work2<- subset(powerdata, Date == "2/2/2007")
work<- rbind(work1,work2)

#Plot - 4
work$Global_active_power <- as.numeric(as.character(work$Global_active_power))
work$Global_reactive_power <- as.numeric(as.character(work$Global_reactive_power))
work$Voltage <- as.numeric(as.character(work$Voltage))
png(filename = "plot4.png", width = 480, height = 480, units = "px")
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), cex= 0.6)
with(work, {
  plot(work$DateTime,work$Global_active_power,type="l", ylab="Global Active Power", xlab= "")
  plot(work$DateTime,work$Voltage,type="l", ylab="Voltage", xlab= "datetime")
  with(work, plot(DateTime, Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "n"))
  with(work, points(DateTime, Sub_metering_1,type="l",  col = "black"))
  with(work, points(DateTime, Sub_metering_2,type="l", col = "red"))
  with(work, points(DateTime, Sub_metering_3,type="l", col = "blue"))
  legend("topright", lty = 1, col= c("black", "red", "blue"), bty = "n", 
         legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  # , cex = 0.7, xjust = 1, inset = c(-0.2, 0))
  plot(work$DateTime,work$Global_reactive_power,type="l", ylab="Global_reactive_power", xlab= "datetime")
})
dev.off() 