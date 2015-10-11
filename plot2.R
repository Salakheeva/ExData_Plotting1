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
plot(p$Global_active_power ~ p$Datetime, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")
#export
dev.copy(png,'plot2.png')
dev.off()