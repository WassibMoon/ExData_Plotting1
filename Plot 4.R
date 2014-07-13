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
datafeb$Voltage =as.numeric(datafeb$Voltage)

par(mfrow = c(2,2))

with(datafeb, {
        plot(datafeb$newdatetime,datafeb$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power(kilowatts)")
        plot(datafeb$newdatetime,datafeb$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
        plot (x= datafeb$newdatetime, y= datafeb$Sub_metering_1,type ="l",
              xlab ="",
              ylab = "Energy sub metering")
        
        lines (x= datafeb$newdatetime, y= datafeb$Sub_metering_2, col ="red")
        lines (x= datafeb$newdatetime, y= datafeb$Sub_metering_3, col ="blue")
        
        legend("topright" ,c("Sub_metering_1 ","Sub_metering_2","Sub_metering_3"),
               lty=c(1,1,2), bty="n",
               lwd=c(2.5,2.5,2.5),col=c("black", "red","blue"))
        plot(datafeb$newdatetime,datafeb$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
})

dev.copy(png, file = "Plot 4.png")
dev.off()