NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")

#Have total emissions from PM2.5 decreased in the Baltimore City, 
#Maryland (fips == "24510") from 1999 to 2008? Use the base plotting system 
#to make a plot answering this question.
NEI_Baltimore <- NEI[NEI$fips=="24510",]
emissions<- aggregate(Emissions ~ year, data=NEI_Baltimore, FUN=sum)
plot(emissions$year, emissions$Emissions, type="l", 
     main="Total PM2.5 emission in Baltimore",
     ylab="Emission", xlab="Year")
dev.copy(png, file="./ExData_Plotting2/plot2.png", height=480, width=480)
dev.off()