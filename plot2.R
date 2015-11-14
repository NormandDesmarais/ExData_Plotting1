plot2 <- function() {
        print("Reading Electric Power Consumption data, this may take a while...")
        p <- read.table(
                "./data/household_power_consumption.txt",
                header = T, sep = ";", na.strings = "?"
        )
        
        # extract only data from 1/2/2007 to 2/2/2007
        p <- p[grep("^1/2/2007|^2/2/2007",p$Date) ,]
        
        # add a column for the Date and Time as a Date format
        library(lubridate)
        p <- cbind(DateTime = dmy_hms(paste(p$Date, p$Time)), p)
        
        fname <- "./ExData_Plotting1/plot2.png"
        png(filename = fname)
        plot(
                p$DateTime ,p$Global_active_power, type = "l", xlab = "",
                ylab = "Global Active Power (kilowatts)"
        )
        dev.off()
        print(paste(
                "Global Active Power consumption plot saved in file:",fname
        ))
}