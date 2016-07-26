#set working directory
setwd("C:/Users/Zach/Desktop/Coursera/4 - Exploratory Data Analysis/Week 4/ExDat_Plotting2")

library(ggplot2)

# read in the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Merge the two datasets
mrg <- merge(NEI, SCC, by="SCC")

#find and subset records with short name containing coal   

coal <- grepl("coal", mrg$Short.Name, ignore.case=TRUE)
sub <- mrg[coal,]


#get totals by year
t0 <- aggregate(Emissions ~ year, sub, sum)


#generate plot
png("plot4.png")

barplot(height = t0$Emissions, 
        names.arg = t0$year,
        xlab = "Year", 
        ylab = expression('total PM'[2.5]*' emissions'), 
        main=expression('Total PM'[2.5]*' emissions from coal sources'))


dev.off()