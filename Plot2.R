a<-read.table("./Data & Analytics/Explanatory Data Analysis Course/Project 1/household_power_consumption.txt", 
              sep = ";", header = TRUE, na.strings = "?")
a$Date <-as.Date(as.character(a$Date), format="%d/%m/%Y")
a<-a[a[,"Date"]>="2007-02-01",]
a<-a[a[,"Date"]<="2007-02-02",]
y_title <- "Global Active Power (kilowatts)"
a$NewDate<-strptime(paste(a$Date,a$Time),"%Y-%m-%d %H:%M:%S")

png(file = "plot2.png", width = 480, height = 480, units = "px")
plot(a$NewDate,a$Global_active_power, type = "l", 
     ylab = y_title, xlab = "")
dev.off()
