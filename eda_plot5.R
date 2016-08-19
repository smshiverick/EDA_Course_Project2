## EXPLORATORY DATA ANALYSIS: COURSE PROJECT TWO
## Q5. How have emissions from motor vehicle sources 
## changed in Baltimore City from 1999–2008? 
library(ggplot2)

## Read dataset: first line will likely take a few seconds
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Subset for motor vehicle sources, in Baltimore City 
motorBalt <- subset(NEI, fips == "24510" & type == "ON-ROAD")

## Create ping file; use ggplot, factor by year, fill = blue, add labels; close dev
png(filename = "eda_plot5.png")
ggplot(motorBalt, aes(x = factor(year), y = Emissions)) + 
    geom_bar(stat = "identity", fill = "blue", width = .5) + 
    xlab("Year") + ylab("Total Motor Vehicle [PM2.5] Emissions per Ton") + 
    ggtitle("Total Motor Vehicle [PM2.5] Emissions in Baltimore, MD by Year")
dev.off()

## Motor vehicle sources of [PM2.5] emissions in Baltimore City decreased from 1999–2008.