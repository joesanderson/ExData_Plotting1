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
png("plot1.png")
hist(corrected_data$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()