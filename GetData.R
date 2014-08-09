GetelectricData<-function(){
    setwd("~/Dokumente/Exploratory Data Analysis/Project 1/ExData_Plotting1")
    if(!file.exists("EPC.zip")){
        download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 
                  destfile="EPC.zip", method="curl")
        unzip("EPC.zip")
    }
        
    library(data.table)
    data<-fread("filtered.txt", na.strings = c("?"), verbose = T)

    data$Date<-as.Date(data$Date, format="%d/%m/%Y")
   # data$Time<-data$Time[, strptime(format = "%H:%M:%S"))
   
   data$Global_active_power<-as.numeric(data$Global_active_power)
   data$Global_reactive_power<-as.numeric(data$Global_reactive_power)
   data$Voltage<-as.numeric(data$Voltage)
   data$Global_intensity<-as.numeric(data$Global_intensity)
   data$Sub_metering_1<-as.numeric(data$Sub_metering_1)
   data$Sub_metering_2<-as.numeric(data$Sub_metering_2)
   data$Sub_metering_3<-as.numeric(data$Sub_metering_3)
   
    data
}