library(ggplot2)
library(plyr)

#Set working directory
setwd("D:/Assignments/DataScienceCoursera/Exploratory Data Analysis/ExData_Plotting2")

# Check if summarySCC_PM25 data exist. If not, load the data.
if (!"summarySCC" %in% ls()) {
  summarySCC <- readRDS("./data/summarySCC_PM25.rds")
}

# Check if Source_Classification_Code data exist. If not, load the data.
if (!"Source_Classification" %in% ls()) {
  Source_Classification <- readRDS("./data/Source_Classification_Code.rds")
}

head(summarySCC)
head(Source_Classification)
dim(summarySCC) 
dim(Source_Classification)

# retrive data for Emmission from coal combusssion
coal <- grep("coal", Source_Classification$Short.Name, ignore.case = T)
coal <- Source_Classification[coal, ]
coal <- summarySCC[summarySCC$SCC %in% coal$SCC, ]

# calculate Total emmission from coal combussion by year
coalEmissions <- aggregate(coal$Emissions, list(coal$year), FUN = "sum")
colnames(coalEmissions)[1] <- "year"
colnames(coalEmissions)[2] <- "Emissions"

# plot basic graph for total emission from coal combusuon yearwise
par("mar"=c(4, 4, 4, 2))
plot(coalEmissions, type = "l",  main = "Total Emissions From Coal Combustion-related\n Sources from 1999 to 2008", xlab = "Year",  ylab = "Total PM2.5 Emission")
##ggplot(data=coalEmissions, aes(x=year, y=Emissions)) + geom_line() + geom_point( size=4, shape=21, fill="white") + xlab("Year") + ylab("Emissions (thousands of tons)") + ggtitle("Total United States PM2.5 Coal Emissions")


# save plot in "PNG" format
dev.copy(png, file="plot4.png", height=600, width=600)
dev.off()

