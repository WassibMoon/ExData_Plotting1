setwd("./data")
data <- read.csv("household_power_consumption.txt", sep = ';', stringsAsFactors = FALSE)
datetime <- paste(data$Date,data$Time)
new  <- strptime(datetime,"%d/%m/%Y %H:%M:%S")
data$newdatetime  <- new
newdate  <-  as.Date(data$Date, "%d/%m/%Y")
data$newdate  <- newdate
str(data)
datafeb <- subset(data, Date=="1/2/2007" | Date =="2/2/2007")

datafeb$Global_active_power =as.numeric(datafeb$Global_active_power)

plot (x= datafeb$newdatetime, y= datafeb$Sub_metering_1,type ="l",
      xlab ="",
      ylab = "Energy sub metering")

lines (x= datafeb$newdatetime, y= datafeb$Sub_metering_2, col ="red")
lines (x= datafeb$newdatetime, y= datafeb$Sub_metering_3, col ="blue")

legend("topright" ,c("Sub_metering_1 ","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,2), bty="n",
       lwd=c(2.5,2.5,2.5),col=c("black", "red","blue"))

dev.copy(png, "plot 3.png")
dev.off()