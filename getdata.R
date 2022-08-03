#
# Read Household Power Consumption dataset and create correct subset
#

data_file <- "household_power_consumption.txt"

# Download Household Power Consumption data and take the subset for 
# 1 Feb 2007 + 2 Feb 2007
get_household_power_consumption_data <- function() {
  # Download and unpack the Household Power Consumption Dataset. 
  # Only do this if the data doesn't exist locally.
  if (!file.exists(data_file)) {
    print(paste("Downloading ", data_file))
    data_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(data_url, 'household_power_consumption.zip')
    unzip('household_power_consumption.zip')
  } else {
    print("Data file already present")
  }
  
  hpc <- read.csv(data_file, header=TRUE, sep=';', na.strings='?')
  hpc_sub <- subset(hpc, Date == '1/2/2007' | Date == '2/2/2007')
  hpc_sub$DateTime <- strptime(paste(hpc_sub$Date, hpc_sub$Time), "%d/%m/%Y %H:%M:%S")
  hpc_sub
}
