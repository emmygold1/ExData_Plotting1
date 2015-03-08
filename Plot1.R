
setwd("~/Coursera_2014/Data Science Specialization/Exploratory Data Analysis_2015/Project 1")

if(!file.exists("exdata-data-household_power_consumption.zip")) {
        temp <- tempfile()
        download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
        file <- unzip(temp)
        unlink(temp)
}


#read and plot the data

plot1 <- function() {
        
        # Read Data
        DF <- read.table(file, header=TRUE, sep=";", colClasses = "character")
        
        # Set required date range
        startDate <- as.Date("2007/02/01", "%Y/%m/%d")
        endDate <- as.Date("2007/02/02", "%Y/%m/%d")
        
        # retrieve required subset data needed from the complete dataset
        data <- subset(DF, as.Date(DF[,1], "%d/%m/%Y") >= startDate & as.Date(DF[,1], "%d/%m/%Y") <= endDate)
        
        # Create histogram and save as png
        hist(as.numeric(data[,3]), main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")
        dev.copy(png, file = "plot1.png", width = 480, height = 480 )
        
        # Close the PNG file device
        dev.off()
        cat("Plot1.png has been saved in", getwd())
}

plot1()



