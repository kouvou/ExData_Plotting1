#Load library sqldf in order to filter the content on txt file
library(sqldf)

#Loading only the needed rows from txt file
data<-read.csv.sql("./household_power_consumption.txt",sql="select * from file where Date='1/2/2007' or Date='2/2/2007'",header = TRUE, sep = ";")

#Setting par(mfrow) 
par(mfrow=c(1,1))

#Creating the Graphs
hist(data$Global_active_power,col="red",main="GLobal Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency")

#Exporting Graphics to PNG file
dev.copy(png, file = "plot1.png",width=480, height=480)

# Closing the png file device
dev.off()