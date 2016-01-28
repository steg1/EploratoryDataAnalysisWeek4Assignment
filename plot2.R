##Assignment Week 4.2

###   Set working directory to where the data lives.
setwd("H:/BigStegShare/COURSERA/DataScience/Exploratory Data Analysis/")

###   Read in data.
##    This first line will likely take a few seconds. Be patient!  The following code comes directly from the class assignment page.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

###################Q2: 2.Have total emissions from PM2.5 decreased in 
###  the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
###  Use the base plotting system to make a plot answering this question.

#subset out the Baltimore City data for the two years we care about
#totalDataQ2 <- subset(NEI, fips == "24510" & year %in% c(1999,2008))
totalDataQ2 <- subset(NEI, fips == "24510")
#Sum totals for each year
totalEmissionsQ2 <- with (totalDataQ2, tapply(Emissions, year, sum))
#plot data, except that the X axis is screwed up...
#plot(totalEmissionsQ2, pch = 20)
#prettier output...
#plot(c("1999","2008"), totalEmissionsQ2, pch = 20)

#open the PNG device
png("./plot2.png", width = 480, height = 480)


plot(totalEmissionsQ2, type = "o", pch = 20, xaxt = "n", xlab = "Year", ylab = "Total PM2.5 Emissions")
title(main = "Total PM2.5 Emissions, Baltimore" )
axis(1, at=1:4, lab = names(totalEmissionsQ2))

#close the PNG
dev.off()
