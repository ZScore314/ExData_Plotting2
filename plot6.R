#set working directory
setwd("C:/Users/Zach/Desktop/Coursera/4 - Exploratory Data Analysis/Week 4/ExDat_Plotting2")

library(ggplot2)

# read in the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Merge the two datasets
mrg <- merge(NEI, SCC, by="SCC")

#Subset only Baltimore data

mrg1 <- subset(mrg, fips == "24510" | fips == "06037")

#find and subset records with sector containing vehicle   

veh <- grepl("vehicle", mrg1$EI.Sector, ignore.case=TRUE)
sub <- mrg1[veh,]


#get totals by year
t0 <- aggregate(Emissions ~ year + fips, sub, sum)
t0$location <- ifelse(t0$fips=="06037", "LA County", "Baltimore City")

#generate plot
png("plot6.png")

qplot(year, Emissions, data=t0, col=location, geom="line") + 
        xlab("Year") + 
        ylab(expression('Total PM'[2.5]*' emission')) +
        ggtitle(expression('Total PM'[2.5]*' emissions by year'))


dev.off()
