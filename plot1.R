PlotGlobalActivePowerHist<-function(data){  
    hist(data$Global_active_power, col=c("red"), main="Global Active Power",
         xlab="Global Active Power (kilowatts)", ylab="Frequency")
    png("plot1.png", width = 480, height=480)
    hist(data$Global_active_power, col=c("red"), main="Global Active Power",
         xlab="Global Active Power (kilowatts)", ylab="Frequency")
    dev.off()
}