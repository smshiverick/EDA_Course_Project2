## EXPLORATORY DATA ANALYSIS: COURSE PROJECT TWO
## Q1: Have total emissions from PM2.5 decreased in US from 1999 to 2008? 
## Using base plotting system to plot total PM2.5 emission from all sources 
## for each of the years 1999, 2002, 2005, and 2008.
setwd("~/data_science_coursera/exploratory_data_analysis/EDA_Course_Project2")
if(!file.exists("./data")){dir.create("./data")}

## EDA_Plot_1. Download the data set, and unzip data files 
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(fileUrl, destfile = "NEI_data.zip", method = "curl")
unzip(zipfile = "NEI_data.zip")

## Read dataset: This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Check size, character of data set, character of Emissions variable
dim(NEI)
# [1] 6497651       6
str(NEI$Emissions)
# num [1:6497651] 15.714 234.178 0.128 2.036 0.388 ...

## Aggregate (sum) total PM25 emissions by year (1999 to 2008)
totalEmissions <- tapply(NEI$Emissions, NEI$year, sum)

## Construct plot, save it to PNG file; include code to copy plot to PNG file; CLOSE PNG device!
png(filename = "eda_plot1.png")
barplot(totalEmissions, xlab='Year', ylab = "Total PM[2.5] per Ton", main = "Total PM[2.5] Emissions by Year")
dev.off()


## Yes, total emissions from PM2.5 decreased in the U.S. from 1999 to 2008