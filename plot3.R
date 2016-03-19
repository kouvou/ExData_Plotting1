#Load library sqldf in order to filter the content on txt file
library(sqldf)

#Loading only the needed rows from txt file
data<-read.csv.sql("./household_power_consumption.txt",sql="select * from file where Date='1/2/2007' or Date='2/2/2007'",header = TRUE, sep = ";")

#Create another data column with the completed date format
data$completedate<-strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 


#Setting par(mfrow) 
par(mfrow=c(1,1))

#Creating the Graphs
plot(data$completedate, data$Sub_metering_1, type="l", col="black",xlab="",ylab="Energy sub metering")
lines(data$completedate, data$Sub_metering_2, col="red")
lines(data$completedate, data$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),cex=0.75,xjust = 1,yjust = 0)

#Exporting Graphics to PNG file
dev.copy(png, file = "plot3.png",width=480, height=480)

# Closing the png file device
dev.off()