#load data
unzip("exdata-data-household_power_consumption.zip")
p<- read.table("household_power_consumption.txt", nrows =1, sep=";",header=T)
name<-names(p)
f <- file("household_power_consumption.txt")
p <- read.table(text = grep("^[1,2]/2/2007", readLines(f), value = TRUE), col.names = name, sep = ";", header = T)
dt<- paste(as.Date(p$Date,format = "%d/%m/%Y"), p$Time)
Sys.setlocale("LC_TIME","English")
p$Datetime <- as.POSIXct(dt)
#plot
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
with(p, {
  plot(Global_active_power ~ Datetime, type = "l", 
       ylab = "Global Active Power", xlab = "")
  plot(Voltage ~ Datetime, type = "l", ylab = "Voltage", xlab = "datetime")
  plot(Sub_metering_1 ~ Datetime, type = "l", ylab = "Energy sub metering",
       xlab = "")
  lines(Sub_metering_2 ~ Datetime, col = 'Red')
  lines(Sub_metering_3 ~ Datetime, col = 'Blue')
  legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
         bty = "n",
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power ~ Datetime, type = "l", 
       ylab = "Global_rective_power", xlab = "datetime")
})
#export
dev.copy(png,'plot4.png')
dev.off()