
# Set working directory
#setwd("D:/Assignments/DataScienceCoursera/Exploratory Data Analysis/ExData_Plotting2")

# Read data from summarySCC_PM25.rds and Source_Classification_Code.rds from folder "data" under working directory

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


# calculate tatal Emission by year
totalEmissions <- aggregate(summarySCC$Emissions, list(summarySCC$year), FUN = "sum")


#Plot basic graph of total emmission yearwise
par("mar"=c(4, 4, 4, 2))
plot(totalEmissions, type = "l", main = "Total Emissions in the United States from 1999 to 2008", xlab = "Year", 
     ylab = "Total Emission From PM2.5")

# Save plot in  png format
dev.copy(png, file="plot1.png", height=600, width=600)
dev.off()

