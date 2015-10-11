#load data
unzip("exdata-data-household_power_consumption.zip")
p<- read.table("household_power_consumption.txt", nrows =1, sep=";",header=T)
name<-names(p)
f <- file("household_power_consumption.txt")
p <- read.table(text = grep("^[1,2]/2/2007", readLines(f), value = TRUE), col.names = name, sep = ";", header = T)
#plot
hist(p$Global_active_power,col='red',xlab="Global Active Power (kilowatts)",main = "Global Active Power")
#export
dev.copy(png,'plot1.png')
dev.off()
