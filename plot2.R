### Reading all data from household_power_consumption.txt file
householdPowerConsumption<-read.table("data/household_power_consumption.txt",sep=";",stringsAsFactors=FALSE, header=TRUE)

### Converting character Date & Time column in to Datetime type column Date_time
### new type: POSIXlt  format: "2006-12-16 17:24:00"
householdPowerConsumption$Date_time<-strptime(paste(householdPowerConsumption$Date,householdPowerConsumption$Time),"%d/%m/%Y %H:%M:%S")

### Converting column 3 to column 9 as numeric
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
### Creating PNG file with a width of 480 pixels and a height of 480 pixels.
png(file="plot2.png",width=480,height=480)

### Generating a plot
plot(twoDaysPowerConsumtion$Date_time,twoDaysPowerConsumtion$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
### Closing the graphic device
dev.off()