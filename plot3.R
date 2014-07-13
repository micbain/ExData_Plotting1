data_powerconsumption<-read.table("household_power_consumption.txt", sep=";", header =T,
                 colClasses=c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric','numeric', 'numeric', 'numeric'),
                 na.strings='?')
# Extract data for 2 dates: Feb 01,2007 and Feb 02, 2007
subdata_powerconsumption<-data_powerconsumption[data_powerconsumption$Date %in% c("1/2/2007","2/2/2007"),]

# Get the date
subdata_powerconsumption$datetime<-strptime(paste(subdata_powerconsumption$Date,subdata_powerconsumption$Time),"%d/%m/%Y %H:%M:%S")

# Open plot3.png
png("plot3.png", height = 480, width = 480)
plot(subdata_powerconsumption$datetime,subdata_powerconsumption$Sub_metering_1,xlab ="", ylab = "Energy sub metering", type ="l",col = 'black')
lines(subdata_powerconsumption$datetime,subdata_powerconsumption$Sub_metering_2, col = "red")
lines(subdata_powerconsumption$datetime,subdata_powerconsumption$Sub_metering_3, col = "blue")
legend('topright',c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c('black','red','blue'), lty = 1, lwd = 3)

# Close png file
dev.off()
