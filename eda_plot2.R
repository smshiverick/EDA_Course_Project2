## EXPLORATORY DATA ANALYSIS: COURSE PROJECT TWO
## Q2. Have total emissions from PM2.5 decreased in Baltimore City MD (fips=="24510") 
## from 1999 to 2008? Use base plotting system to make a plot answering this question.

## Read dataset: This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Subset NEI data set for Baltimore City, MD (fips=="24510") 
baltimore <- subset(NEI, fips == "24510")

## Aggregate (sum) PM25 data by year from the subset of data set
totalBaltEmissions <- tapply(baltimore$Emissions, baltimore$year, sum)

## Create plot as ping file and close directory
png(filename = "eda_plot2.png")
barplot(totalBaltEmissions, xlab='Year', ylab = "Total PM[2.5] per Ton", main = "Total PM[2.5] Emissions in Baltimore City, MD by Year")
dev.off()

## Yes, overall, total [PM2.5] emissions in Baltimore City, MD decreased from 1999 to 2008; 
## between 2002 and 2005, PM2.5 levels increased somewhat, however, PM2.5 levels decreased
## from 1999 to 2002 and again from 2005 to 2008. Overall, PM2.5 levels decreased in this period. 