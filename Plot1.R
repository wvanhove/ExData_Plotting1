## download the data file, binary so use mode = wb
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "./Project1.zip", mode = "wb")

## unzip and read in the data, there are headers in first row, separator is ;
unzip("Project1.zip", exdir = ".")
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)
head(data)
tail(data)
## subset the data for the date range
subset <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

## Plot 1
subset$Global_active_power <- as.numeric(subset$Global_active_power)
png("plot1.png", width=480, height=480)
with(subset, hist(Global_active_power, breaks=12, col='red', xlab='Global Active Power (kilowatts)', main='Global Active Power'))
dev.off()