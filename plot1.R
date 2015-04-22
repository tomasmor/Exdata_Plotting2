NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")

# Using the base plotting system, make a plot showing the total PM2.5 
# emission from all sources for each of the years 1999, 2002, 2005, and 2008. 
NEI$year <- factor(NEI$year)
emissions<- aggregate(Emissions ~ year, data=NEI, FUN=sum)
plot(emissions$year, emissions$Emissions, type="l", main="Total PM2.5 emission",
     ylab="Emission", xlab="Year")
dev.copy(png, file="./ExData_Plotting2/plot1.png", height=480, width=480)
dev.off()