NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")

#Of the four types of sources indicated by the type (point, nonpoint, onroad,
#nonroad) variable, which of these four sources have seen decreases in
#emissions from 1999–2008 for Baltimore City? Which have seen increases in
#emissions from 1999–2008? Use the ggplot2 plotting system to make a plot 
#answer this question

library(ggplot2)
NEI_Baltimore <- NEI[NEI$fips=="24510",]
NEI$type <- factor(NEI$type)
emissions<- aggregate(Emissions ~ year + type, data=NEI_Baltimore, FUN=sum)
ggplot(data=emissions, aes(x=year, y=Emissions, group=type, colour=type)) + 
  geom_line() + geom_point() + xlab("Year") + ylab("Emissions") + 
  ggtitle("Emissions from Baltimore by source type")

dev.copy(png, file="./ExData_Plotting2/plot3.png", height=480, width=480)
dev.off()