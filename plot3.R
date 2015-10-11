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
par(mfrow = c(1,1))
dev.off()
legtext <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
with(p, plot(Sub_metering_1 ~ Datetime, type = "l", 
             ylab = "Energy sub metering", xlab = ""))
with(p,lines(Sub_metering_2 ~ Datetime, col = 'Red'))
with(p,lines(Sub_metering_3 ~ Datetime, col = 'Blue'))
legend("topright", x.intersp=0.1, xjust=0, yjust=0, legend =legtext, cex=0.2,pt.cex = 1,col = c("black", "red", "blue"), lty = 1, lwd = 2) 
#export
dev.copy(png,'plot3.png')
dev.off()
