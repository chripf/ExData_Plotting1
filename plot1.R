PlotGlobalActivePowerHist<-function(data){  
    png("plot1.png")
    hist(data$Global_active_power, col=c("red"), main="Global Active Power",
         xlab="Global Active Power (kilowatts)", ylab="Frequency")
    dev.off()
}