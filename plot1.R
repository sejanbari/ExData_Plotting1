#load file
powerdata<-read.table("~\\household_power_consumption.txt", header = TRUE, sep = ";")
powerdata$DateTime<-strptime(paste(powerdata$Date, powerdata$Time, sep=""), format="%d/%m/%Y %H:%M:%S")
work1<- subset(powerdata, Date == "1/2/2007")
work2<- subset(powerdata, Date == "2/2/2007")
work<- rbind(work1,work2)

#Plot - 1
work$Global_active_power <- as.numeric(as.character(work$Global_active_power))

png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(work$Global_active_power, col = "red", breaks = 25, main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off() 
