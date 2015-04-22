NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")

#Compare emissions from motor vehicle sources in Baltimore City with emissions from motor 
#vehicle sources in Los Angeles County, California (fips == "06037"). 
#Which city has seen greater changes over time in motor vehicle emissions?

NEI_motor <- NEI[(NEI$fips =="24510" | NEI$fips ==  "06037") & NEI$type=="ON-ROAD",]
emissions<- aggregate(Emissions ~ year + fips, data=NEI_motor, FUN=sum)
library(ggplot2)
ggplot(data=emissions, aes(x=year, y=Emissions, group=fips, color=fips)) + geom_line() + geom_point() + 
  xlab("Year") + ylab("Emissions") + ggtitle("Emission from motor sources in Baltimore and Los Angeles County")


dev.copy(png, file="./ExData_Plotting2/plot6.png", height=480, width=480)
dev.off()