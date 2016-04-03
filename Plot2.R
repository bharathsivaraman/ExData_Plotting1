library(dplyr)
library(ggplot2)
setwd("C:\\Users\\Bharath.Sivaraman\\Documents\\R programming\\Power Consumption")
power_consum<-read.csv("household_power_consumption.txt",sep=";",stringsAsFactors = FALSE)
power_consum$Date<-as.Date(power_consum$Date,"%d/%m/%Y")
power_consum<-tbl_df(power_consum)
power_consum<-filter(power_consum,Date=="2007-02-01"|Date=="2007-02-02")
names(power_consum)<-tolower(names(power_consum))
power_consum$global_active_power<-as.numeric(power_consum$global_active_power)
#qplot(global_active_power,data=power_consum,geom="histogram",fill=I("Red"),xlab="Global Active Power(Kilowatts)",ylab="Frequency",main="Global Active Power")
#ggsave(file="plot1.png")

power_consum$datetime<-strptime(paste(as.character(power_consum$date),power_consum$time,sep=" "),format="%Y-%m-%d %H:%M:%S")
qplot(datetime,global_active_power,data=power_consum,geom="line",ylab="Global Active Power(Kilowatts)",xlab ="")
ggsave(file="plot2.png")


