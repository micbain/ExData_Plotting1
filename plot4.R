data_powerconsumption<-read.table("household_power_consumption.txt", sep=";", header =T,
                 colClasses=c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric','numeric', 'numeric', 'numeric'),
                 na.strings='?')
# Extract data for 2 dates: Feb 01,2007 and Feb 02, 2007
subdata_powerconsumption<-data_powerconsumption[data_powerconsumption$Date %in% c("1/2/2007","2/2/2007"),]

# Get the date
subdata_powerconsumption$datetime<-strptime(paste(subdata_powerconsumption$Date,subdata_powerconsumption$Time),"%d/%m/%Y %H:%M:%S")

# Open plot4.png
png("plot4.png", height = 480, width = 480)

# multiplot
par(mfrow=c(2,2))
# Global Active Power plot
plot(subdata_powerconsumption$datetime,subdata_powerconsumption$Global_active_power,xlab ="", ylab = "Global Active Power", type ="l")

# Voltage plot
plot(subdata_powerconsumption$datetime,subdata_powerconsumption$Voltage,xlab ="datetime", ylab = "Voltage", type ="l")

# Energy sub metering
plot(subdata_powerconsumption$datetime,subdata_powerconsumption$Sub_metering_1,xlab ="", ylab = "Energy sub metering", type ="l",col = 'black')
lines(subdata_powerconsumption$datetime,subdata_powerconsumption$Sub_metering_2, col = "red")
lines(subdata_powerconsumption$datetime,subdata_powerconsumption$Sub_metering_3, col = "blue")
legend('topright',c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c('black','red','blue'), lty = 1, lwd = 3)

# Global Reactive power
plot(subdata_powerconsumption$datetime,subdata_powerconsumption$Global_reactive_power,xlab ="datetime", ylab = "Global_reactive_power", type ="l")

# Close png file
dev.off()

