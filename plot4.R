plot4 <- function() {
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
        
        fname <- "./ExData_Plotting1/plot4.png"
        png(filename = fname)
        par(mfcol = c(2,2))
        plot(
                p$DateTime ,p$Global_active_power, type = "l", xlab = "",
                ylab = "Global Active Power (kilowatts)"
        )
        
        plot(
                p$DateTime, p$Sub_metering_1, type = "l", xlab = "",
                ylab = "Energy sub-metering"
        )
        lines(p$DateTime, p$Sub_metering_2, col = "red")
        lines(p$DateTime, p$Sub_metering_3, col = "blue")
        legend(
                "topright", lty = 1, col = c("black", "red", "blue"),
                legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
                bty = "n"
        )
        
        plot(
                p$DateTime ,p$Voltage, type = "l", xlab = "datetime",
                ylab = "Voltage"
        )
        
        plot(
                p$DateTime ,p$Global_reactive_power, type = "l",
                xlab = "datetime", ylab = "Global Reactive Power"
        )
        
        
        dev.off()
        print(paste("Energy consumption's panels plot saved in file:",fname))
}