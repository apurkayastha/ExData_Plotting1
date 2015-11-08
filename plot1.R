#Coode for Plot 1

data <- read.table("household_power_consumption.txt", 
                   header=TRUE, na.strings="?",sep=";",stringsAsFactors = FALSE)

data$Date <- as.Date(data$Date,"%d/%m/%Y")
subdata <- subset(data, data$Date=="2007-02-01" | data$Date=="2007-02-02")
png(file="plot1.png", width = 480, height = 480, units = "px")
hist(subdata$Global_active_power, main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)")
dev.off()