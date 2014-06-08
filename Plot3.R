a<-read.table("./Data & Analytics/Explanatory Data Analysis Course/Project 1/household_power_consumption.txt", 
a<-read.table("./Data & Analytics/Explanatory Data Analysis Course/Project 1/household_power_consumption.txt", 
              sep = ";", header = TRUE, na.strings = "?")
a$Date <-as.Date(as.character(a$Date), format="%d/%m/%Y")
a<-a[a[,"Date"]>="2007-02-01",]
a<-a[a[,"Date"]<="2007-02-02",]
a$NewDate<-strptime(paste(a$Date,a$Time),"%Y-%m-%d %H:%M:%S")

png(file = "plot3.png", width = 480, height = 480, units = "px")
plot(a$NewDate, a$Sub_metering_1, type = "l", 
     ylab = "Energy sub metering", xlab = "")
lines(a$NewDate, a$Sub_metering_2, col = "red")
lines(a$NewDate, a$Sub_metering_3, col = "blue")
legend("topright", pch = "_", col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
