### download and unzip the data
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
temp<-download.file(url, destfile="./temp.zip")
unzip("temp.zip")


### load the whole dataset
all_data<-read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", )


### extract only data from 2007-02-01 and 2007-02-02. 
data <- all_data[all_data$Date == "1/2/2007" | all_data$Date == "2/2/2007", ]


### create a new column with date&time
data$DateTime <- strptime(paste(newdata$Date, newdata$Time), "%d/%m/%Y %H:%M:%S")


### prepare the png device
png("plot4.png",  width = 480, height = 480)


### create the picture
par(mfrow = c(2,2))

# first plot
plot(data$DateTime, data$Global_active_power, 
     xlab = "", ylab = "Global Active Power", 
     pch=NA, 
     lines(data$DateTime, data$Global_active_power))

# second plot
plot(data$DateTime, data$Voltage, 
     xlab = "datetime", ylab = "Voltage", 
     pch=NA, 
     lines(data$DateTime, data$Voltage))


# third plot
plot(data$DateTime, data$Sub_metering_1,
     xlab="", ylab="Energy sub metering", type="n")

lines(data$DateTime, data$Sub_metering_1, col="black")
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")

legend("topright", 
       col = c("black", "red", "blue"), 
       lwd = 1, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#fourth plot
plot(data$DateTime, data$Global_reactive_power, 
     xlab = "datetime", ylab = "Global_reactive_power", 
     pch=NA, 
     lines(data$DateTime, data$Global_reactive_power))


### close the device
dev.off()