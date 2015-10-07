## download the data file, binary so use mode = wb
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "./Project1.zip", mode = "wb")

## unzip and read in the data, there are headers in first row, separator is ;
unzip("Project1.zip", exdir = ".")
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)
head(data)
tail(data)

## subset the data for the date range
subset <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

## create date time stamp
subset$Datetime <- strptime(paste(as.Date(subset$Date, "%d/%m/%Y"), subset$Time), "%Y-%m-%d %H:%M:%S")

## create plot
png(filename = "plot2.png", width=480, height=480)
plot(subset$Datetime, subset$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type='l')
dev.off()
