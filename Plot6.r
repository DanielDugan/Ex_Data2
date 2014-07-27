## Load data into R
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## automotive emissons
moto_i<- which(regexpr("Vehicles", SCC$Short.Name)>0)
moto_S <- SCC$SCC[moto_i]
NEI_moto <- NEI[NEI$SCC%in%mot_S,]

## Baltimore and Cali Emissons
NEI_cities <- NEI_moto[NEI_moto$fips %in% c("24510","06037"),]

## Format data and plot
NEI_year <- aggregate(Emissions ~ year + fips, data=NEI_cities, sum)
NEI_year[NEI_year$fips=="24510",4] <- "Baltimore City"
NEI_year[NEI_year$fips=="06037",4] <- "California"
colnames(NEI_year)[4] <- "city"


library(ggplot2)
qplot(year, Emissions, data=NEI_year, col=city, xlab="year", 
      ylanb="PM2.5 Emission(Tons)", 
      main="Emission Change by Vehicle in Baltimore City and California")

## Write plot to disk
dev.copy(png, file="plot6.png")
dev.off()