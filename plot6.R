library(ggplot2)
library(plyr)

# set working directory
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

# filter data for baltimore city and Los Angeles
baltimoreLos <- summarySCC[summarySCC$fips == "24510"|summarySCC$fips == "06037", ] 

# retrive Emmission data from motor vehicle source for baltimore city and Los Angeles
motor <- grep("motor", Source_Classification$Short.Name, ignore.case = T)
motor <- Source_Classification[motor, ]
motor <- baltimoreLos[baltimoreLos$SCC %in% motor$SCC, ]

# plot graph of Comparison of Total Emissions From Motor Vehicle Sources in Baltimore City and Los Angeles County from 1999 to 2008

par("mar"=c(4, 4, 4, 2))
g <- ggplot(motor, aes(year, Emissions, color = fips))
g + geom_line(stat = "summary", fun.y = "sum") +  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle("Comparison of Total Emissions From Motor\n Vehicle Sources in Baltimore City\n and Los Angeles County from 1999 to 2008") +
  scale_colour_discrete(name = "Group", label = c("Los Angeles","Baltimore"))

# save graph in "png" format
dev.copy(png, file="plot6.png", height=600, width=600)
dev.off()



