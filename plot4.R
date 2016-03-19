#Load library sqldf in order to filter the content on txt file
library(sqldf)

#Loading only the needed rows from txt file
data<-read.csv.sql("./household_power_consumption.txt",sql="select * from file where Date='1/2/2007' or Date='2/2/2007'",header = TRUE, sep = ";")

#Create another data column with the completed date format
data$completedate<-strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Setting par(mfrow) 
par(mfrow=c(2,2))

#Creating the Graphs
plot(data$completedate, data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
plot(data$completedate, data$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(data$completedate, data$Sub_metering_1, type="l", col="black",xlab="",ylab="Energy sub metering")
lines(data$completedate, data$Sub_metering_2, col="red")
lines(data$completedate, data$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,bty="n",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),cex=0.7,xjust=1)
plot(data$completedate, data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

#Exporting Graphics to PNG file
dev.copy(png, file = "plot4.png",width=480, height=480)

# Closing the png file device
dev.off()