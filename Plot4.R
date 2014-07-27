## Read in data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Find which SCC are corresponding to Coal
coal_index <- which(regexpr("Coal", SCC$Short.Name)>0)
coal_index_SCC <- SCC$SCC[coal_index]
NEI_index <- NEI[NEI$SCC%in%coal_index_SCC,]

## Split sum by years and plot
emi_index <- aggregate(Emissions ~ year, data=NEI_index, sum)
library(ggplot2)
ggplot(emi_index, aes(x=factor(year),y=emissions)) + geom_bar(stat = "identity") +
  ggtitle("Emissions by Coal Combustion") + labs(x = "Years", y="Emissions")