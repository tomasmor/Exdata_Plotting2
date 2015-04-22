NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")

#How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

NEI_Baltimore_motor <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",]
emissions<- aggregate(Emissions ~ year, data=NEI_Baltimore_motor, FUN=sum)

library(ggplot2)
ggplot(data=emissions, aes(x=year, y=Emissions)) + geom_line() + geom_point() + 
  xlab("Year") + ylab("Emissions") + ggtitle("Emission from motor sources in Baltimore")


dev.copy(png, file="./ExData_Plotting2/plot5.png", height=480, width=480)
dev.off()