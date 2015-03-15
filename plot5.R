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

# filter data for baltimore city
baltimoreCity <- summarySCC[summarySCC$fips == "24510", ] 

# Retrive data for emmission from motor vehicle in baltimore city
motor <- grep("motor", Source_Classification$Short.Name, ignore.case = T)
motor <- Source_Classification[motor, ]
motor <- baltimoreCity[baltimoreCity$SCC %in% motor$SCC, ]

# summarise Total emmission from motor vehicle in baltimore city by year from 1999-2008
motorEmissions <- aggregate(motor$Emissions, list(motor$year), FUN = "sum")

# plot graph of Total Emissions From Motor Vehicle Sources from 1999 to 2008 in Baltimore City
par("mar"=c(4, 4, 4, 2))
plot(motorEmissions, type = "l", main = "Total Emissions From Motor Vehicle Sources\n from 1999 to 2008 in Baltimore City", xlab = "Year", ylab = "Total PM2.5 Emission")

#Save graph in "PNG" Format
dev.copy(png, file="plot5.png", height=600, width=600)
dev.off()



