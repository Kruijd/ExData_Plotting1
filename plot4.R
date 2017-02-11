#Assignment for Exploratory Data analysis
# plot 4

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
    Gap<- as.numeric(sub(',', '.', powerdata2$Global_active_power))
    Grp<- as.numeric(sub(',', '.', powerdata2$Global_reactive_power))
    Volt<- as.numeric(sub(',', '.', powerdata2$Voltage))
    subMetering1 <- as.numeric(powerdata2$Sub_metering_1)
    subMetering2 <- as.numeric(powerdata2$Sub_metering_2)
    subMetering3 <- as.numeric(powerdata2$Sub_metering_3)

#Create plot4.png
png(filename="plot4.png",width=480,height=480) 
    par(mfrow = c(2,2)) 
#1. Global active Power
    plot(x,Gap,type="l" ,xlab="",ylab="Global active Power" )
#2. Voltage
    plot(x,Volt,type="l" ,xlab="Datetime",ylab="Voltage")
#3.sub Metering
    plot(x,subMetering1,type="l" ,xlab="",ylab="Energy sub metering" )
    lines(x,subMetering2,type="l",col="red")
    lines(x,subMetering3,type="l",col="blue")
      # prepare legend
    labels<-c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
    linecols<-c("black", "red", "blue")
      # create legend
    legend("topright", labels, lty=1, lwd=2.5, col=linecols)
#4. global reactive power
    plot(x,Grp,type="l" ,xlab="Datetime",ylab="global reactive power")
 dev.off()