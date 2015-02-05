#load required libraries
library(dplyr)
library(lubridate)

#tidy data
data<-read.table("household_power_consumption.txt",header=TRUE,as.is=TRUE,sep=";",na.strings="?")
corrected_data<-data%>%
    filter(Date=="1/2/2007"|Date=="2/2/2007")%>%
    mutate(dateAndTime=paste(Date,Time))%>%
    mutate(trueDate=parse_date_time(dateAndTime,"dmyhms"))%>%
    select(11,3:9)

#prepare plot
png("plot3.png")
plot(corrected_data$trueDate,corrected_data$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
lines(corrected_data$trueDate,corrected_data$Sub_metering_2,type="l",col="red")
lines(corrected_data$trueDate,corrected_data$Sub_metering_3,type="l",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1,1))
dev.off()