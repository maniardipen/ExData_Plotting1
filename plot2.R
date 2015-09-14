plot2<-function(){
  png("plot2.png",width = 480, height = 480)
  library(sqldf)
  plot2_data<-read.csv.sql("household_power_consumption.txt",sql = "select * from file 
                   where Date = '1/2/2007' or Date = '2/2/2007'",header= TRUE, 
                   sep = ';')
  plot2_data$Date<-paste(plot2_data$Date,plot2_data$Time,sep = " ")
  plot2_data$Date<-strptime(plot2_data$Date, "%d/%m/%Y %H:%M:%S")
  x<-plot2_data$Date
  y<-plot2_data$Global_active_power
  plot(x,y,type = "l",xlab="",ylab="Global Active Power (Kilowatts)")
  dev.off()
  
}