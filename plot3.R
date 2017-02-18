###upload data
#setwd("D:/CloudDisk/YandexDisk/Educational/2016.09 - Data Science/4 course - Exploratory Data Analysis/week_1/")
hpc <- read.csv(file = "./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
hpc[,1] <- as.Date(hpc[,1], format = "%d/%m/%Y")
hpc <- hpc[(hpc[,1] >= as.Date("01/02/2007",format = "%d/%m/%Y") & hpc[,1] <= as.Date("02/02/2007",format = "%d/%m/%Y")),]
hpc$time <- strptime(paste(hpc[,1], hpc[,2], sep = " "), format = "%Y-%m-%d %H:%M:%S")

###plot data
png(filename = "plot3.png", width = 480, height = 480, units = "px")
with(hpc, {
        plot(time, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
        points(time, Sub_metering_2, type = "l", col = "red")
        points(time, Sub_metering_3, type = "l", col = "blue")
        legend("topright", pch = 151, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})
dev.off()

###clean environment
remove(hpc)
