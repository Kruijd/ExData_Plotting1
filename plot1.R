#Assignment for Exploratory Data analysis
# plot 1

#Read Data 
zipurl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
      if(!file.exists("./data")){dir.create("./data")}
      download.file(zipurl,"./data/Power.zip")
      unzip("./data/Power.zip", exdir="./data")
# read  table only for dates 2007-02-01 and 2007-02-02
      powerdata<-read.table("./data/household_power_consumption.txt",sep=";",header=TRUE)
      mydates <- c("1/2/2007","2/2/2007")
      powerdata2<-subset(powerdata, Date=="1/2/2007"| Date=="2/2/2007")                    
#Create plot1.png and close graphics device
    png(filename="plot1.png",width=480,height=480)      
      hist(as.numeric(powerdata2$Global_active_power)
        ,main ="Global Active Power"
        ,xlab="Global Active Power (kilowatts)"
        ,ylab="Frequency"
        ,col="red")
    dev.off()
