setwd("~/Coursera_2014/Data Science Specialization/Exploratory Data Analysis_2015/Project 1")

if(!file.exists("exdata-data-household_power_consumption.zip")) {
        temp <- tempfile()
        download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
        file <- unzip(temp)
        unlink(temp)
}


#read and plot the data

plot3 <- function() {
        
        # Read Data
        
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
        # plots Date & Time (X) vs Sub metering 1, 2 and 3 (Y)
        plot(tempDateTime, as.numeric(data[,7]), type = "n", ylab = "Energy sub metering", xlab = "")
        lines(tempDateTime, as.numeric(data[,7]), type = "l")
        lines(tempDateTime, as.numeric(data[,8]), type = "l", col = "red")
        lines(tempDateTime, as.numeric(data[,9]), type = "l", col = "blue")
        legend("topright", col = c("black", "red", "blue"), legend = c(names(data[7]),names(data[8]),names(data[9])), lty = c(1,1))
        
        # copy and save as png
        dev.copy(png, file = "plot3.png", width = 480, height = 480 )
        
        # Close the PNG file device
        dev.off()
        cat("Plot3.png has been saved in", getwd())
}

plot3()