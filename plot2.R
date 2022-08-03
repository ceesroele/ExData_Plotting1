# Draw value of Global Active Power for datetime

# Get the subset of the data using shared function from getdata.R
source('getdata.R')
hpc_sub <- get_household_power_consumption_data()


png(file="plot2.png", width=480, height=480)
with(hpc_sub, plot(DateTime,
                   Global_active_power,
                   type='l',
                   ylab="Global Active Power (kilowatts)",
                   xlab=''))
dev.off()
