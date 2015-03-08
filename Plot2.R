
setwd("~/Coursera_2014/Data Science Specialization/Exploratory Data Analysis_2015/Project 1")

if(!file.exists("exdata-data-household_power_consumption.zip")) {
        temp <- tempfile()
        download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
        file <- unzip(temp)
        unlink(temp)
}


#read and plot the data

plot2 <- function() {
        
        # Read Data
        
        DF <- read.table(file, header=TRUE, sep=";", colClasses = "character")
        
        # Set required date range
        beforeDate <- as.Date("2007/02/01", "%Y/%m/%d")
        afterDate <- as.Date("2007/02/02", "%Y/%m/%d")
        
        # retrieve required subset
        data <- subset(DF, as.Date(DF[,1], "%d/%m/%Y") >= beforeDate & as.Date(DF[,1], "%d/%m/%Y") <= afterDate)
        
        # concatenate date and time values and convert to date type
        tempDateTime <- paste(data[,1], data[,2], sep = ",")
        tempDateTime <- strptime(tempDateTime, format="%d/%m/%Y,%H:%M:%S")
                
        
        # plots Date & Time (X) vs Global Active Power (Y) and save as png
        plot(tempDateTime, as.numeric(data[,3]), type = "n", ylab = "Global Active Power (kilowatts)", xlab = "")
        lines(tempDateTime, as.numeric(data[,3]), type = "l")
        dev.copy(png, file = "plot2.png", width = 480, height = 480 )
        
        # Create line chart and save as png
        #png(filename = "plot2.png", width = 480, height = 480 )
        
        # Close the PNG file device
        dev.off()
        cat("Plot2.png has been saved in", getwd())
}

plot2()



