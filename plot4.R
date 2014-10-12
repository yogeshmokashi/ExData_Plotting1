drawPlot4 <- function() {
    # set working directory
    setwd("C:\\Yogesh\\Online_learning")
    
    # read data from text file
    filename = ".\\data\\household_power_consumption.txt"
    
    conn = file(filename, open="r")
    
    data <- read.table(conn, header=TRUE, sep = ";", na.strings="?")
    
    # close data file connection
    close(conn)
    
    # select necessary data for plot
    tobeselected <- which(data$Date == "1/2/2007" | data$Date == "2/2/2007")
    
    finaldata <- data[tobeselected, ]

    # convert character string to DateTime format
    finaldata$Date <- strptime(paste(finaldata$Date, " ", finaldata$Time), 
                               "%d/%m/%Y %H:%M:%S")


    # draw line plot using png device
    # open png device
    png(file = "plot4.png", width = 480, height = 480)
    
    # set number of plots per row
    par(mfcol=c(2,2), mar=c(4,4,2,1))
    
    ## Plot at 1,1 - top left
    # draw line plot; datetime on x axis, GlobalActivePpwer on y axis
    # type="l" is for line plot
    plot(finaldata$Date, finaldata$Global_active_power, type="l", 
         xlab="", ylab="Global Active Power (kilowatts)")
    
    
    ## Plot at 2,1 - bottom left
    # draw line plot; datetime on x axis, Sub_metering on y axis
    # type="s" is for stair steps plot    
    # draw plot 1
    plot(finaldata$Date, finaldata$Sub_metering_1, type="s", 
         ylim=c(0,40), xlab="", ylab="Energy sub metering", col="black")
    
    # set par, so that second plot can be drawn on top of first
    par(new=TRUE)
    
    # draw plot 2
    plot(finaldata$Date, finaldata$Sub_metering_2, type="s", 
         ylim=c(0,40), xlab="", ylab="Energy sub metering", col="red")
    
    # set par, so that third plot can be drawn on top of first and second
    par(new=TRUE)
    
    # draw plot 3
    plot(finaldata$Date, finaldata$Sub_metering_3, type="s", 
         ylim=c(0,40), xlab="", ylab="Energy sub metering", col="blue")
    
    # add legend for all 3 plots
    legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
           lwd=2, bty="n", col=c("black", "red", "blue"))
    
    
    
    ## Plot at 2,1 - top right
    # draw line plot; datetime on x axis, Voltage on y axis
    # type="l" is for line plot
    plot(finaldata$Date, finaldata$Voltage, type="l", 
         xlab="datetime", ylab="Voltage")
    
    
    
    ## Plot at 2,1 - bottom right
    # draw line plot; datetime on x axis, Global_reactive_power on y axis
    # type="l" is for line plot
    plot(finaldata$Date, finaldata$Global_reactive_power, type="l", 
         xlab="datetime", ylab="Global_reactive_power")    
    
    
    # close png device
    dev.off()
}