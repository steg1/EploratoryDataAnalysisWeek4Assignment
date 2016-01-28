##Assignment Week 4.3

library(ggplot2)

###   Set working directory to where the data lives.
setwd("H:/BigStegShare/COURSERA/DataScience/Exploratory Data Analysis/")

###   Read in data.
##    This first line will likely take a few seconds. Be patient!  The following code comes directly from the class assignment page.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

###################
### Q3: Of the four types of sources indicated by the type (point, nonpoint, 
### onroad, nonroad) variable, which of these four sources have seen decreases 
### in emissions from 1999-2008 for Baltimore City? Which have seen increases ?
### in emissions from 1999-2008? Use the ggplot2 plotting system to make a 
### plot answer this question.
totalDataQ3 <- subset(NEI, fips == "24510" & year < 2009 & year > 1998)
totalDataQ3 <- subset(NEI, fips == "24510" & year %in% c(1999,2008))
g2 <- ggplot(totalDataQ2, aes(year, Emissions))
g2 + geom_point() + facet_grid(.~type, margins = TRUE) + geom_line() + coord_cartesian(xlim = c(1999,2008)) + ggtitle("Emission Type Changes for Baltimore City") + ylab("Total PM2.5 Emissions (Tons)") + xlab("Year") + theme(axis.text.x = element_text(angle=90))
ggsave("plot3.png",width=4,height=4)
