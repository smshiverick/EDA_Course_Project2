## EXPLORATORY DATA ANALYSIS: COURSE PROJECT TWO
## Q3. Of sources indicated by 𝚝𝚢𝚙𝚎 (point, nonpoint, onroad, nonroad) variable, 
## (a) Which have seen decreases in emissions from 1999–2008 for Baltimore City? 
## (b) Which have seen increases in emissions from 1999–2008? Use ggplot2 system

## Load ggplot2 plotting system
library(ggplot2)

## Read dataset: first line will likely take a few seconds
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Subset NEI data set for Baltimore; aggregate subset by year 
baltimore <- subset(NEI, fips == "24510")
totalBaltEmissions <- aggregate(Emissions ~ year, baltimore, sum) 

## Create panel plot as ping file and close directory
png(filename = "eda_plot3.png")

## Setup ggplot with data frame; add layers, points; make panels
ggplot(baltimore, aes(factor(year), Emissions, fill = type)) + 
    geom_bar(stat = "identity") +  
    facet_grid(.~type, scales = "free", space = "free") + 
    labs(x = "year") + labs(y = "Total [PM2.5] per Ton") + 
    labs(title = "Total [PM2.5] Emissions in Baltimore MD by Year and Source")
dev.off()