##Assignment Week 4.5

library(ggplot2)

###   Set working directory to where the data lives.
setwd("H:/BigStegShare/COURSERA/DataScience/Exploratory Data Analysis/")

###   Read in data.
##    This first line will likely take a few seconds. Be patient!  The following code comes directly from the class assignment page.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

###################
### Q5: How have emissions from motor vehicle sources changed from 1999-2008 
### in Baltimore City?
totalDataQ5 <- subset(NEI, fips == "24510" & year < 2009 & year > 1998)
motorVehicles <- grep("Mobile",levels(SCC$EI.Sector))
motorVehItems <- levels(SCC$EI.Sector)[motorVehicles]
motorVehSCC <- SCC$SCC[SCC$EI.Sector %in% motorVehItems]
newNEI <- totalDataQ5[totalDataQ5$SCC %in% motorVehSCC,]
q5 <- ggplot(newNEI, aes(factor(year), Emissions))
q5 + geom_bar(stat = "identity") + ggtitle("Change in Emissions from Motor Vehicle Sources") + ylab("Total PM2.5 Emissions (Tons)") + xlab("Year")

ggsave("plot5.png",width=4,height=4)
