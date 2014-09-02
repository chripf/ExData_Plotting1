PlotGlobalActivePowerOverWeek<-function(data){ 
    data[,Date:=as.Date(data$Date, format="%d/%m/%Y")]
    data[,WeekDayStr:=format(Date, "%a")]
    data[,WeekDayNo:=as.numeric(format(Date, "%w"))]
     # todo rank by day    
    plotData<-data[WeekDayNo>3,]
    plotData<-plotData[order(rank(WeekDayNo,Time)),]
    
    
     plot(plotData$Global_active_power, 
          type="h", xlab = plotData$WeekDayStr , ylab = "Global active")
   # png("plot2.png", width = 480, height=480)
#    hist(data$Global_active_power, col=c("red"), main="Global Active Power",
 #        xlab="Global Active Power (kilowatts)", ylab="Frequency")
  #  dev.off()
}