##Assignment Week 4.1


###   Set working directory to where the data lives.
setwd("H:/BigStegShare/COURSERA/DataScience/Exploratory Data Analysis/")

###   Read in data.
##    This first line will likely take a few seconds. Be patient!  The following code comes directly from the class assignment page.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

###   Assignment Question 1: Have total emissions from PM2.5 
###       decreased in the United States from 1999 to 2008? Using 
###       the base plotting system, make a plot showing the total 
###       PM2.5 emission from all sources for each of the years 
###       1999, 2002, 2005, and 2008.

# sub out just the years we care about
totalDataQ1 <- subset(NEI, year %in% c(1999, 2002, 2005, 2008))

# convert years to factors for convenience
#totalDataQ1$year <- as.factor(totalDataQ1$year)

#sum all emissions by year
totalEmissionsQ1 <- with (totalDataQ1, tapply(Emissions, year, sum))

#open the PNG device
png("./plot1.png", width = 480, height = 480)

#plot emissions by year
plot(totalEmissionsQ1, type = "o", pch = 20, xaxt = "n", xlab = "Year", ylab = "Total PM2.5 Emissions")
title(main = "Total PM2.5 Emissions 1999-2008" )
axis(1, at=1:4, lab=names(totalEmissionsQ1))

#close the PNG
dev.off()