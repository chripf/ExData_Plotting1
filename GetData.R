# set the working directory to the file location's directory when it is sourced
# the hardcoded way may look like:
#    setwd("~/Dokumente/Exploratory Data Analysis/Project 1/ExData_Plotting1")
# this way the files can be copied wherever you want them
this.dir <- dirname(parent.frame(2)$ofile) 
setwd(this.dir)

GetelectricData<-function(loadall=FALSE){
    # download an unzip raw data, if needed        
    if(!file.exists("EPC.zip")){
        download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 
                  destfile="EPC.zip", method="curl")
        unzip("EPC.zip")
    }
    
    filename<-"household_power_consumption"
    
    # by default expect a file named filtered.txt containing only data
    # from february to load (much) less data
    if(!loadall&!file.exists("filtered.txt")){
        stop("To create filtered.txt containing data only from february
        run these commands on a (unix) console:
        $ more household_power_consumption.txt | grep '01/02/2007' >> filtered.txt
        $ more household_power_consumption.txt | grep '01/02/2007' >> filtered.txt
        (or pass TRUE to the function to load ALL data)")        
    }else{
        filename<-"filtered.txt"
    }
        
    library(data.table)
    
    data<-fread(filename, na.strings = c("?"), verbose = T)
    
    data[,DTstr:=paste(Date,Time)]
    #data[,DateTime:=as.POSIXct(strptime(data$DTStr, "%d/%m/%Y %H:%M:%S"))]
    
    data$Date<-as.Date(data$Date, format="%d/%m/%Y")
    #data$Time<-as.POSIXct(strptime(data$Time, "%H:%M:%S"))
           
    data$Global_active_power<-as.numeric(data$Global_active_power)
    data$Global_reactive_power<-as.numeric(data$Global_reactive_power)
    data$Voltage<-as.numeric(data$Voltage)
    data$Global_intensity<-as.numeric(data$Global_intensity)
    data$Sub_metering_1<-as.numeric(data$Sub_metering_1)
    data$Sub_metering_2<-as.numeric(data$Sub_metering_2)
    data$Sub_metering_3<-as.numeric(data$Sub_metering_3)
   
    #data[data$Date<as.Date("20070203", "%Y%m%d") & data$Date>=as.Date("20070201", "%Y%m%d")]   
    data
}
