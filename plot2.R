PlotGlobalActivePowerOverWeek<-function(data){ 
     data[order(rank(day, Time))]
      
    plot(data$Time, data$Global_active_power, 
         xlab="", 
         ylab = "Global Active Power (kilowatts)",
         xlim=c(0,7), 
         ylim=c(0,8))
   # png("plot2.png", width = 480, height=480)
#    hist(data$Global_active_power, col=c("red"), main="Global Active Power",
 #        xlab="Global Active Power (kilowatts)", ylab="Frequency")
  #  dev.off()
}