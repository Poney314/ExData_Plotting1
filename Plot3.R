#Plot 3
setwd('C:/Users/Igor/Desktop/DiretorioR/exdata_data_household_power_consumption')

#Reading the data
file <- "household_power_consumption.txt"

data <- read.table(file, 
                   header=TRUE, 
                   sep=";", 
                   stringsAsFactors=FALSE,
)

#Here we only read the data between jan/07 and feb/07
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Transforming the data following the script 
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "),"%d/%m/%Y %H:%M:%S") 

# Transforming the data following the script 

globalActivePower <- as.numeric(subSetData$Global_active_power)
subMetric1 <- as.numeric(subSetData$Sub_metering_1)
subMetric2 <- as.numeric(subSetData$Sub_metering_2)
subMetric3 <- as.numeric(subSetData$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(datetime, subMetric1, type="l", ylab="Energy subMetric", xlab="")
lines(datetime, subMetric2, type="l", col="red")
lines(datetime, subMetric3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.off()

