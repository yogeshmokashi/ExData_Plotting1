drawPlot1 <- function() {
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

    
    # draw histogram using png device
    # open png device
    #png(file = "plot1.png", width = 480, height = 480)
    
    # draw histogram
    hist(finaldata$Global_active_power, col="red", 
         main="Global Active Power", xlab="Global Active Power (kilowatts)")
    
    # close png device
    #dev.off()
}