#set working directory
setwd("C:/Users/Zach/Desktop/Coursera/4 - Exploratory Data Analysis/Week 4/ExDat_Plotting2")

# read in the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Subset only Baltimore data

sub <- subset(NEI, fips == "24510")


#get totals by year
t0 <- with(sub,tapply(Emissions, year, sum))


#generate plot
png("plot2.png")

barplot(height = t0, 
        xlab = "Year", 
        ylab = expression('Total PM'[2.5]*' emission'), 
        main=expression('Baltimore City Total PM'[2.5]*' emissions by year'))

dev.off()