#Plot 1
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


#Plot 1:

file <- "household_power_consumption.txt"

data <- read.table(file, 
                   header=TRUE, 
                   sep=";", 
                   stringsAsFactors=FALSE,
)

#Here we only read the data between jan/07 and feb/07
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

globalActivePower <- as.numeric(subSetData$Global_active_power)

png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
