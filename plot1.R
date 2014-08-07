#Plot 1
# Change working directory
setwd("C:/Users/almenard/Desktop/Coursera - Data Science/Exploratory Data Analysis/programming assignment/week 1")

# Getting full data
powerConsumption <- read.csv("./exdata-data-household_power_consumption/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                             nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

# Household power consumption for Feb. 1 and 2, 2007 only
powerConsumption2 <- powerConsumption[as.character(powerConsumption$Date) %in% c("1/2/2007", "2/2/2007"),]
# Concatante Date and Time variables
powerConsumption2$dateTime = paste(powerConsumption2$Date, powerConsumption2$Time)

# Convert to Date/Time class
powerConsumption2$dateTime <- strptime(powerConsumption2$dateTime, "%d/%m/%Y %H:%M:%S")
attach(powerConsumption2)

png("plot1.png", width=480, height=480, units="px")
# Plot the distribution of global active power
hist(as.numeric(as.character(Global_active_power)), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()