
setwd("~/Coursera_2014/Data Science Specialization/Exploratory Data Analysis_2015/Project 1")

if(!file.exists("exdata-data-household_power_consumption.zip")) {
        temp <- tempfile()
        download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
        file <- unzip(temp)
        unlink(temp)
}


#read and plot the data
plot4 <- function() {
        
        # Read Data
        #filename <- "household_power_consumption.txt"
        DF <- read.table(file, header=TRUE, sep=";", colClasses = "character")
        
        # Set required date range
        startDate <- as.Date("2007/02/01", "%Y/%m/%d")
        endDate <- as.Date("2007/02/02", "%Y/%m/%d")
        
        # retrieve required subset
        data <- subset(DF, as.Date(DF[,1], "%d/%m/%Y") >= startDate & as.Date(DF[,1], "%d/%m/%Y") <= endDate)
        
        # concatenate date and time values and convert to date type
        tempDateTime <- paste(data[,1], data[,2], sep = ",")
        tempDateTime <- strptime(tempDateTime, format="%d/%m/%Y,%H:%M:%S")
        
        
        # Create line chart and save as png
        png(filename = "plot4.png", width = 480, height = 480 )
        
        # setting to draw 4 graphs in 2 by 2 format and ordered by plots 1 and 2
        # followed by plots 3 and 4
        par(mfrow = c(2,2))
        
        # first plot: Date & Time (X) vs Global Active Power (Y)
        plot(tempDateTime, as.numeric(data[,3]), type = "n", ylab = "Global Active Power", xlab = "")
        lines(tempDateTime, as.numeric(data[,3]), type = "l")
        
        # second plot: Date & Time (X) vs Voltage (Y)
        plot(tempDateTime, as.numeric(data[,5]), type = "n", ylab = names(data[5]), xlab = "datetime")
        lines(tempDateTime, as.numeric(data[,5]), type = "l")
        
        # third plot: Date & Time (X) vs Sub metering 1, 2 and 3 (Y)
        plot(tempDateTime, as.numeric(data[,7]), type = "n", ylab = "Energy sub metering", xlab = "")
        lines(tempDateTime, as.numeric(data[,7]), type = "l")
        lines(tempDateTime, as.numeric(data[,8]), type = "l", col = "red")
        lines(tempDateTime, as.numeric(data[,9]), type = "l", col = "blue")
        legend("topright", col = c("black", "red", "blue"), legend = c(names(data[7]),names(data[8]),names(data[9])), lty = c(1,1), bty = "n")
        
        # last plot: Date & Time (X) vs Global Reactive Power (Y)
        plot(tempDateTime, as.numeric(data[,4]), type = "n", ylab = names(data[4]), xlab = "datetime")
        lines(tempDateTime, as.numeric(data[,4]), type = "l")
        
             
        # Close the PNG file device
        dev.off()
        cat("Plot4.png has been saved in", getwd())
        
}

