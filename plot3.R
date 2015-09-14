plot3<-function(){
  png("plot3.png",width = 480, height = 480)
  library(sqldf)
  plot3_data<-read.csv.sql("household_power_consumption.txt",sql = "select * from file 
                            where Date = '1/2/2007' or Date = '2/2/2007'",header= TRUE, 
                            sep = ';')
  plot3_data$Date<-paste(plot3_data$Date,plot3_data$Time,sep = " ")
  plot3_data$Date<-strptime(plot3_data$Date, "%d/%m/%Y %H:%M:%S")
  x<-plot3_data$Date
  a<-plot3_data$Sub_metering_1
  b<-plot3_data$Sub_metering_2
  c<-plot3_data$Sub_metering_3
  plot(x,a,type="l",xlab = "",ylab = "Energy sub metering")
  points(x,b,type="l",col="red")
  points(x,c,type="l",col="blue")
  legend("topright",lty = 1,col=c("black","red","blue"),
         legend=c("Sub_metering_1","Sub_metering_1","Sub_metering_3"))
  dev.off()
}