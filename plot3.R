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

# summerise total emmission data of baltimore city type wise
baltimoreCity.type <- ddply(baltimoreCity, .(year, type), function(x) sum(x$Emissions))



# plot graph of Baltimore City PM2.5 Emmission by source, type and year
par("mar"=c(4, 4, 4, 2))
colnames(baltimoreCity.type)[3] <- "Emissions"
qplot(year, Emissions, data=baltimoreCity.type, color=type, geom ="line") + ggtitle("Baltimore City PM2.5 Emmission by source, type and year") + xlab("Year") + ylab(expression("Total PM2.5 Emissions (in tons)"))

# Save plot in "PNG" Format
dev.copy(png, file="plot3.png", height=600, width=600)
dev.off()

