
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

# calculate total emission of baltimore city from year 1999 to 2008
totalEmissions <- aggregate(baltimoreCity$Emissions, list(baltimoreCity$year), FUN = "sum")

# plot basic plot of Total Emissions in Baltimore City from 1999 to 2008 yearwise
par("mar"=c(4, 4, 4, 2))
plot(totalEmissions, type = "l", main = "Total Emissions in Baltimore City from 1999 to 2008", xlab = "Year", 
     ylab = "Total Emission From PM2.5")

# Save the plot in "PNG" format
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()

