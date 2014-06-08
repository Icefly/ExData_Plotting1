a<-read.table("./Data & Analytics/Explanatory Data Analysis Course/Project 1/household_power_consumption.txt", 
              sep = ";", header = TRUE, na.strings = "?")
a$Date <-as.Date(as.character(a$Date), format="%d/%m/%Y")
a<-a[a[,"Date"]>="2007-02-01",]
a<-a[a[,"Date"]<="2007-02-02",]
a$NewDate<-strptime(paste(a$Date,a$Time),"%Y-%m-%d %H:%M:%S")

png(file = "plot4.png", width = 480, height = 480, units = "px")
par(mfcol=c(2,2), cex = 0.8 )
plot(a$NewDate,a$Global_active_power, type = "l", 
     ylab = "Global_active_power", xlab = "")

plot(a$NewDate, a$Sub_metering_1, type = "l", 
     ylab = "Energy sub metering", xlab = "")
lines(a$NewDate, a$Sub_metering_2, col = "red")
lines(a$NewDate, a$Sub_metering_3, col = "blue")
legend("topright", pch = "_", col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(a$NewDate, a$Voltage, type = "l", 
     ylab = "Voltage", xlab = "datetime")
plot(a$NewDate, a$Global_reactive_power, type = "l", 
     ylab = "Global_reactive_power", xlab = "datetime")

dev.off()
