#Plot 2
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
globalActivePower <- as.numeric(subSetData$Global_active_power)

png("plot2.png")
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)",width=480, height=480)
dev.off()

