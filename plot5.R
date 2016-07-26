#set working directory
setwd("C:/Users/Zach/Desktop/Coursera/4 - Exploratory Data Analysis/Week 4/ExDat_Plotting2")

library(ggplot2)

# read in the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Merge the two datasets
mrg <- merge(NEI, SCC, by="SCC")

#Subset only Baltimore data

mrg1 <- subset(mrg, fips == "24510")

#find and subset records with sector containing vehicle   

veh <- grepl("vehicle", mrg1$EI.Sector, ignore.case=TRUE)
sub <- mrg1[veh,]


#get totals by year
t0 <- aggregate(Emissions ~ year, sub, sum)


#generate plot
png("plot5.png")

barplot(height = t0$Emissions, 
        names.arg = t0$year,
        xlab = "Year", 
        ylab = expression('total PM'[2.5]*' emissions'), 
        main=expression('Total PM'[2.5]*' emissions from motor vehicle sources in Baltimore City'))


dev.off()