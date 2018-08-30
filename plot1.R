# Course 4: Exploratory Data Analysis 
# Week 1 Assignment, plot 1

setwd("~/Desktop/Data Science Courses/Data Science Specialization JHU/Exploratory Data Analysis/Week 1 Assignment")

# read in data
cols <-c(rep('character',2),rep('numeric',7))
data <- read.csv("household_power_consumption.txt", header = TRUE, 
                 sep=';',na.strings='?', colClasses = cols)

# subset data by date
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

# make tibble for ease
data <- tbl_df(data)

# open file device
png("plot1.png", width = 480, height = 480, units = "px")

# plot histogram of the global active power variable
hist(data$Global_active_power,
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)",
     col = "Red")

# close file device
dev.off()