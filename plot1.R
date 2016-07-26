#set working directory
setwd("C:/Users/Zach/Desktop/Coursera/4 - Exploratory Data Analysis/Week 4/ExDat_Plotting2")

# read in the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


#get totals by year
t0 <- with(NEI,tapply(Emissions, year, sum))


#generate plot
png("plot1.png")

barplot(height = t0, 
        xlab = "Year", 
        ylab = expression('total PM'[2.5]*' emission'), 
        main=expression('Total PM'[2.5]*' emissions by year'))

dev.off()