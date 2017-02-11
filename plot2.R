#Assignment for Exploratory Data analysis
# plot 2

#Read Data 
zipurl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
      if(!file.exists("./data")){dir.create("./data")}
      download.file(zipurl,"./data/Power.zip")
      unzip("./data/Power.zip", exdir="./data")
      
# read  table only for dates 2007-02-01 and 2007-02-02
      powerdata<-read.table("./data/household_power_consumption.txt",sep=";",header=TRUE)
      mydates <- c("1/2/2007","2/2/2007")
      powerdata2<-subset(powerdata, Date=="1/2/2007"| Date=="2/2/2007")
      

#convert date and Time into new variable DateTime
  powerdata2$DateTime <- paste(powerdata2$Date, powerdata2$Time, sep=" ")

# prepare X and Y formats
      x<-strptime(powerdata2$DateTime, "%d/%m/%Y %H:%M:%S") 
      y<- as.numeric(sub(',', '.', powerdata2$Global_active_power))

#Create plot2.png and close graphics device
      png(filename="plot2.png",width=480,height=480)      
      plot(x,y,type="l"
     ,xlab=""     
     ,ylab="Global Active Power (kilowatts)"
        )
      dev.off()
