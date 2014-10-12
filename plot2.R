drawPlot2 <- function() {
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
    png(file = "plot2.png", width = 480, height = 480)
    
    # draw line plot; datetime on x axis, GlobalActivePpwer on y axis
    # type="l" is for line plot
    plot(finaldata$Date, finaldata$Global_active_power, type="l", 
         xlab="", ylab="Global Active Power (kilowatts)")
    
    # close png device
    dev.off()
}