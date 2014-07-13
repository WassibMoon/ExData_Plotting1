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

plot(datafeb$newdatetime, datafeb$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power(kilowatts)")

dev.copy(png, "plot 2.png")
dev.off()