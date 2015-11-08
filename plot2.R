#Coode for Plot 2

data <- read.table("household_power_consumption.txt", 
                   header=TRUE, na.strings="?",sep=";",stringsAsFactors = FALSE)

data$Date <- as.Date(data$Date,"%d/%m/%Y")
subdata <- subset(data, data$Date=="2007-02-01" | data$Date=="2007-02-02")
subdata$Time <- strptime(paste(subdata$Date, subdata$Time), format="%Y-%m-%d %H:%M:%S")
png(file="plot2.png", width = 480, height = 480, units = "px")
with(subdata, plot(Time, Global_active_power, type="l",xlab="",ylab="Global Active Power (in kilowatts)"))
dev.off()