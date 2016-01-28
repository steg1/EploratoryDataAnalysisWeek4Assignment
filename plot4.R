##Assignment Week 4.4

library(ggplot2)

###   Set working directory to where the data lives.
setwd("H:/BigStegShare/COURSERA/DataScience/Exploratory Data Analysis/")

###   Read in data.
##    This first line will likely take a few seconds. Be patient!  The following code comes directly from the class assignment page.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

###################
### Q4: Across the United States, how have emissions from coal combustion-related 
### sources changed from 1999-2008?

totalDataQ4 <- subset(NEI, year < 2009 & year > 1998)

coalCats <- grep("Coal",levels(SCC$EI.Sector))
coalItems <- levels(SCC$EI.Sector)[coalCats]
coalSCC <- SCC$SCC[SCC$EI.Sector %in% coalItems]
#coalComb <- grep("Comb", SCC$EI.Sector[coalCats])
#create subset of NEI with just the coal combustion info.

newNEIQ4 <- totalDataQ4[totalDataQ4$SCC %in% coalSCC,]

q4 <- ggplot(newNEIQ4, aes(factor(year), Emissions))
q4 + geom_bar(stat = "identity") + ggtitle("Change in Emissions from Coal Combustion-Related Sources") + ylab("Total PM2.5 Emissions (Tons)") + xlab("Year")

ggsave("plot4.png",width=4,height=4)
