plot1 <- function() {
        print("Reading Electric Power Consumption data, this may take a while...")
        p <- read.table(
                "./data/household_power_consumption.txt",
                header = T, sep = ";", na.strings = "?"
        )
        
        # extract only data from 1/2/2007 to 2/2/2007
        p <- p[grep("^1/2/2007|^2/2/2007",p$Date) ,]
        
        fname <- "./ExData_Plotting1/plot1.png"
        png(filename = fname)
        hist(
                p$Global_active_power, col = "red", main = "Global Active Power",
                xlab = "Global Active Power (kilowatts)"
        )
        dev.off()
        print(paste("Global Active Power histogram plot saved in file:",fname))
}