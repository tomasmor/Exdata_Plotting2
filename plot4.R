NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

#Across the United States, how have emissions from coal combustion-related 
#sources changed from 1999–2008?
library(ggplot2)
SCC_coal = SCC[grepl("coal", SCC$Short.Name, ignore.case=TRUE),]
NEI_coal <- subset(NEI,SCC %in% SCC_coal$SCC)
emissions<- aggregate(Emissions ~ year, data=NEI_coal, FUN=sum)
ggplot(data=emissions, aes(x=year, y=Emissions)) + geom_line() + geom_point() + 
  xlab("Year") + ylab("Emissions") + ggtitle("Emission from coal combustion related sources")
dev.copy(png, file="./ExData_Plotting2/plot4.png", height=480, width=480)
dev.off()