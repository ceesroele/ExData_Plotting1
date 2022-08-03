# Draw a histogram of Global Active Power

# Get the subset of the data using shared function from getdata.R
source('getdata.R')
hpc_sub <- get_household_power_consumption_data()

png(file="plot1.png", width=480, height=480)
with(hpc_sub, hist(Global_active_power,
                   main="Global Active Power",
                   xlab="Global Active Power (kilowatts)",
                   ylab="Frequency",
                   col="red"))
dev.off()
