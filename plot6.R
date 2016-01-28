##Assignment Week 4

###   Set working directory to where the data lives.
setwd("H:/BigStegShare/COURSERA/DataScience/Exploratory Data Analysis/")

###   Read in data.
##    This first line will likely take a few seconds. Be patient!  The following code comes directly from the class assignment page.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

###################
### Q6: Compare emissions from motor vehicle sources in Baltimore City with 
### emissions from motor vehicle sources in Los Angeles County, California 
### (fips == "06037"). Which city has seen greater changes over time in motor 
### vehicle emissions?
motorVehicles <- grep("Mobile",levels(SCC$EI.Sector))
motorVehItems <- levels(SCC$EI.Sector)[motorVehicles]
motorVehSCC <- SCC$SCC[SCC$EI.Sector %in% motorVehItems]

q6baltimore1 <- subset(NEI, fips == "24510" & year < 2009 & year > 1998)
q6lacounty1 <- subset(NEI, fips == "06037" & year < 2009 & year > 1998)

q6Baltimore <- q6baltimore1[q6baltimore1$SCC %in% motorVehSCC,]
q6LACounty <- q6lacounty1[q6lacounty1$SCC %in% motorVehSCC,]

#open the PNG device
png("./plot6.png", width = 480, height = 480)

new1 <- with (q6Baltimore, tapply(Emissions, year, sum))
new2 <- with (q6LACounty, tapply(Emissions, year, sum))

compareThem<- data.frame(new1)
compareThem[2]<- data.frame(new2)

plot(compareThem$new1, type = "o", pch = 22, col = "red", ylim = c(0,13000), xaxt = "n", mar = c(4,4,2,1), xlab = "Year", ylab = "Total PM2.5 Emissions", main = "PM2.5 Emissions (Tons) Over Time", las = 2)
lines(compareThem$new2, type = "o", pch = 22, col = "blue")
axis(1, at=1:4, lab=names(compareThem$new1))
legend("topright", legend = c("Baltimore","Los Angeles County"), col= c("red","blue"), lty = 1)
box(which = "plot", lty = 1)

#close the PNG
dev.off()