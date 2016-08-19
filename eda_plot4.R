## EXPLORATORY DATA ANALYSIS: COURSE PROJECT TWO
## Q4. Across US, how have coal combustion emissions changed from 1999–2008?

## Load ggplot2 plotting system
library(ggplot2)

## Read dataset: first line will likely take a few seconds
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Subset dataset for coal combustion-related emissions 
coalSCC <- SCC[grep("coal", SCC$Short.Name), ] 
coalNEI <- NEI[NEI$SCC %in% coalSCC$SCC, ]

## Create ping file; use ggplot with data frame, add layers, points; close dev
png(filename = "eda_plot4.png")
ggplot(coalNEI, aes(x = factor(year), y = Emissions, fill = type)) + 
    geom_bar(stat = "identity", width = .4) + 
    xlab("year") + ylab("Total Coal Related [PM2.5] Emission per Ton") + 
    ggtitle("Total Coal Related [PM2.5] Emissions in U.S. by Year")
dev.off()

## Across U.S., coal combustion-related sources of PM2.5 Emissions decreased, 
## overall, from 1999–2008.