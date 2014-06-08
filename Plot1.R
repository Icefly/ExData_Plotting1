a<-read.table("./Data & Analytics/Explanatory Data Analysis Course/Project 1/household_power_consumption.txt", 
              sep = ";", header = TRUE, na.strings = "?")
a$Date <-as.Date(as.character(a$Date), format="%d/%m/%Y")
a<-a[a[,"Date"]>="2007-02-01",]
a<-a[a[,"Date"]<="2007-02-02",]
x_title <- "Global Active Power (kilowatts)"

png(file = "plot1.png", width = 480, height = 480, units = "px")
hist(a$Global_active_power, col = "red", 
     main = "Global Active Power", xlab = x_title)
dev.off()
