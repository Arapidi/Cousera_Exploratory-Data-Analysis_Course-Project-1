###upload data
#setwd("D:/CloudDisk/YandexDisk/Educational/2016.09 - Data Science/4 course - Exploratory Data Analysis/week_1/")
hpc <- read.csv(file = "./household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
#setwd("D:/CloudDisk/YandexDisk/Educational/2016.09 - Data Science/4 course - Exploratory Data Analysis/week_1/Cousera_Exploratory-Data-Analysis_Course-Project-1/")
hpc[,1] <- as.Date(hpc[,1], format = "%d/%m/%Y")
hpc <- hpc[(hpc[,1] >= as.Date("01/02/2007",format = "%d/%m/%Y") & hpc[,1] <= as.Date("02/02/2007",format = "%d/%m/%Y")),]

###plot data
hist(hpc$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

###create png
dev.copy(png, file = "plot1.png", width = 480, height = 480, units = "px")
dev.off()

###clean environment
remove(hpc)
