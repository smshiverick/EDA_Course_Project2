## EXPLORATORY DATA ANALYSIS: COURSE PROJECT TWO
## Q6. Compare motor vehicles emissions in Baltimore with LA Co., CA (𝚏𝚒𝚙𝚜 == "𝟶𝟼𝟶𝟹𝟽"). 
## Which city has seen greater changes over time in motor vehicle emissions?
library(ggplot2)

## Read dataset: first line will likely take a few seconds
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Subset for motor vehicles, 
motor <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case = TRUE)
motorSCC <- SCC[motor,]$SCC
motorNEI <- NEI[NEI$SCC %in% motorSCC, ]

## Subset motor vehicles for Baltimore City, LA County
motorBalt <- motorNEI[motorNEI$fips=="24510",]
motorBalt$city <- "Baltimore City"

motorLaco <- motorNEI[motorNEI$fips=="06037",]
motorLaco$city <- "Los Angeles County"

## Combine subsets and bind as a data fram
motorEmissions <- rbind(motorBalt, motorLaco)

## Create png file; use ggplot for panel plot, add labels; close directory
png(filename = "eda_plot6.png")
ggplot(motorEmissions, aes(x=factor(year), y=Emissions, fill=city)) + 
    geom_bar(aes(fill=year), stat="identity") +  
    facet_grid(.~city, scales="free", space="free") + 
    labs(x="year", y=expression("Motor Vehcile [PM2.5] Emissions")) + 
    labs(title=expression("Motor Vehicle [PM2.5] Emissions in Baltimore MD and LA Co. by Year"))
dev.off()

## Motor vehicle sources of [PM2.5] in Baltimore City, MD decreased from 1999–2008; 
## however, motor vehicle [PM2.5] emissions in Los Angeles County increased from
## 1999 to 2002, and 2005, then decreased from 2005 to 2008. Overall [PM2.5] 
## emissions from motor vehicles in L.A. County increased from 1999 to 2008.

