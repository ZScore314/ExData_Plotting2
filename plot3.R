#set working directory
setwd("C:/Users/Zach/Desktop/Coursera/4 - Exploratory Data Analysis/Week 4/ExDat_Plotting2")

library(ggplot2)

# read in the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Subset only Baltimore data

sub <- subset(NEI, fips == "24510")


#get totals by year & type
t0 <- aggregate(Emissions ~ year + type, sub, sum)


#generate plot
png("plot3.png")

qplot(year, Emissions, data=t0, col=type, geom="line") + 
        xlab("Year") + 
        ylab(expression('Total PM'[2.5]*' emission')) +
        ggtitle(expression('Baltimore City Total PM'[2.5]*' emissions by type, year'))


dev.off()