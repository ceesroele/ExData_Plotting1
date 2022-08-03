# Draw sub-metering against datetime

# Get the subset of the data using shared function from getdata.R
source('getdata.R')
hpc_sub <- get_household_power_consumption_data()

png(file="plot3.png", width=480, height=480)
with(hpc_sub, plot(DateTime,
                   Sub_metering_1,
                   type='l',
                   ylab="Energy sub metering",
                   xlab=''))
with(hpc_sub, lines(DateTime, Sub_metering_2, col="red"))
with(hpc_sub, lines(DateTime, Sub_metering_3, col="blue"))
legend(x="topright", 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=c(1,1,1),
       y.intersp=1,
       col=c("black","red","blue"))
dev.off()
