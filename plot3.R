#Coode for Plot 3

data <- read.table("household_power_consumption.txt", 
                   header=TRUE, na.strings="?",sep=";",stringsAsFactors = FALSE)

data$Date <- as.Date(data$Date,"%d/%m/%Y")
subdata <- subset(data, data$Date=="2007-02-01" | data$Date=="2007-02-02")
subdata$Time <- strptime(paste(subdata$Date, subdata$Time), format="%Y-%m-%d %H:%M:%S")
png(file="plot3.png", width = 480, height = 480, units = "px")
plot(subdata$Time,subdata$Sub_metering_1,type="l",xlab="", ylab="Energy sub metering")
lines(subdata$Time, subdata$Sub_metering_2, col="red")
lines(subdata$Time, subdata$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=c(1,1,1), col=c("black","red", "blue"))
dev.off()