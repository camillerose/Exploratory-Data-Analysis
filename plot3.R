# Course 4: Exploratory Data Analysis 
# Week 1 Assignment, plot 3

setwd("~/Desktop/Data Science Courses/Data Science Specialization JHU/Exploratory Data Analysis/Week 1 Assignment")

# read in data
cols <-c(rep('character',2),rep('numeric',7))
data <- read.csv("household_power_consumption.txt", header = TRUE, 
                 sep=';',na.strings='?', colClasses = cols)

# subset data by date
data <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

# make tibble for ease
data2 <- tbl_df(data)

# add column to data set for weekdays 
data2$DateTime<-dmy(data2$Date)+hms(data2$Time)
data2$DateTime<-as.POSIXlt(data2$DateTime)

# open file device
png("plot3.png", width = 480, height = 480, units = "px")

# plot line plot of the sub metering variables over time

plot(x = data2$DateTime, y = data2$Sub_metering_1, 
     ylab = "Energy sub metering", xlab="",
     type = "l")

lines(x = data2$DateTime, y = data2$Sub_metering_2, col="red")

lines(x = data2$DateTime, y = data2$Sub_metering_3, col="blue")

# add legend
legend("topright", col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1)


# close file device
dev.off()