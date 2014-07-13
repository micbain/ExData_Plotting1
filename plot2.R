data_powerconsumption<-read.table("household_power_consumption.txt", sep=";", header =T,
                 colClasses=c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric','numeric', 'numeric', 'numeric'),
                 na.strings='?')
# Extract data for 2 dates: Feb 01,2007 and Feb 02, 2007
subdata_powerconsumption<-data_powerconsumption[data_powerconsumption$Date %in% c("1/2/2007","2/2/2007"),]

# Get the date
subdata_powerconsumption$datetime<-strptime(paste(subdata_powerconsumption$Date,subdata_powerconsumption$Time),"%d/%m/%Y %H:%M:%S")

# Open plot2.png
png("plot2.png", height = 480, width = 480)
plot(subdata_powerconsumption$datetime,subdata_powerconsumption$Global_active_power,xlab ="", ylab = "Global Active Power (kilowatts)", type ="l")
# Close png file
dev.off()