plot4<-function(){
  png("plot4.png",width = 480, height = 480)
  library(sqldf)
  plot4_data<-read.csv.sql("household_power_consumption.txt",sql = "select * from file 
                           where Date = '1/2/2007' or Date = '2/2/2007'",header= TRUE, 
                           sep = ';')
  plot4_data$Date<-paste(plot4_data$Date,plot4_data$Time,sep = " ")
  plot4_data$Date<-strptime(plot4_data$Date, "%d/%m/%Y %H:%M:%S")
  x<-plot4_data$Date
  y<-plot4_data$Global_active_power
  a<-plot4_data$Sub_metering_1
  b<-plot4_data$Sub_metering_2
  c<-plot4_data$Sub_metering_3
  d<-plot4_data$Voltage
  e<-plot4_data$Global_reactive_power
  par(mfrow=c(2,2))
  plot(x,y,type = "l",xlab="",ylab="Global Active Power")
  plot(x,d,type="l",xlab = "datetime",ylab = "Voltage")
  plot(x,a,type="l",xlab = "",ylab = "Energy sub metering")
  points(x,b,type="l",col="red")
  points(x,c,type="l",col="blue")
  plot(x,e,type = "l",xlab = "datetime",ylab = "Global_reactive_power")
  dev.off()
  
}