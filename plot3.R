### Reading all data from household_power_consumption.txt file
householdPowerConsumption<-read.table("data/household_power_consumption.txt",sep=";",stringsAsFactors=FALSE, header=TRUE)

### Converting character Date & Time variables in to Datetime type variable Date_time
### new type: POSIXlt  format: "2006-12-16 17:24:00"
householdPowerConsumption$Date_time<-strptime(paste(householdPowerConsumption$Date,householdPowerConsumption$Time),"%d/%m/%Y %H:%M:%S")

### Converting variable 3 to variable 9 as numeric
for (columns in 3:9)
{
        householdPowerConsumption[,columns] = suppressWarnings(as.numeric(householdPowerConsumption[,columns]))
        
}

### Storing data subset related date filter in POSIXlt format
### 2007-02-01 and 2007-02-02
Start_date<-strptime("2007-02-01 00:00:00","%Y-%m-%d %H:%M:%S")
End_date<-strptime("2007-02-02 23:59:59","%Y-%m-%d %H:%M:%S")

###Subsetting data for February 1, 2007 and February 2, 2007
twoDaysPowerConsumtion<-subset(householdPowerConsumption,Date_time>=Start_date&Date_time<=End_date)

### Opening a bitmap graphic device (.png)
### Creating PNG file with a width of 480 pixels and a height of 480 pixels
png(file="plot3.png",width=480,height=480)

### Generating an initial plot
plot(twoDaysPowerConsumtion$Date_time,twoDaysPowerConsumtion$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
### Adding two more lines to the existing plot
lines(twoDaysPowerConsumtion$Date_time,twoDaysPowerConsumtion$Sub_metering_2,col="red")
lines(twoDaysPowerConsumtion$Date_time,twoDaysPowerConsumtion$Sub_metering_3,col="blue")
### Populating the legend
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_2"))
### Closing the graphic device
dev.off()