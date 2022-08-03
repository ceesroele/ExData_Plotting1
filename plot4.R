# Draw 

# Get the subset of the data using shared function from getdata.R
source('getdata.R')
hpc_sub <- get_household_power_consumption_data()

png(file="plot4.png", width=480, height=480)

# Define 2x2 panels
par(mfrow=c(2,2))

# Panel 1/1: Global Active Power
with(hpc_sub, plot(DateTime,
                   Global_active_power,
                   type='l',
                   ylab="Global Active Power",
                   xlab=''))

# Panel 1/2: Voltage
with(hpc_sub, plot(DateTime,
                   Voltage,
                   type='l',
                   ylab="Voltage",
                   xlab='datetime'))

# Panel 2/1: Sub-metering
with(hpc_sub, plot(DateTime,
                   Sub_metering_1,
                   type='l',
                   ylab="Energy sub metering",
                   xlab=''))
with(hpc_sub, lines(DateTime, Sub_metering_2, col="red"))
with(hpc_sub, lines(DateTime, Sub_metering_3, col="blue"))
legend(x="topright", 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=c(1,1,1), # solid line type
       y.intersp=1, # line spacing
       col=c("black","red","blue"),
       cex=0.7, # Reduce font size of legend
       bty='n' # Remove border
       )

# Panel 2/2: Global Reactive Power
with(hpc_sub, plot(DateTime,
                   Global_reactive_power,
                   type='l',
                   ylab="Global_reactive_power",
                   xlab='datetime'))


dev.off()
