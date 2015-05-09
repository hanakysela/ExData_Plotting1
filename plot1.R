setwd("C:/Users/Hana/Dropbox/Git/ExData_Plotting1")

### 1. download and unzip the data

url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
temp<-download.file(url, destfile="./temp.zip")
unzip("temp.zip")

# ? delete temp (original zipped file)


### 2. load the whole dataset

all_data<-read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", )

# use only data from 2007-02-01 and 2007-02-02. 
data <- all_data[all_data$Date == "1/2/2007" | all_data$Date == "2/2/2007", ]


#modify the column classes


data$Date <- as.Date(data$Date)


# use only data from 2007-02-01 and 2007-02-02. 



### 3. create the picture


### 4. save the pic to .png


### 5. clear the list of values