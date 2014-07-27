## Read in data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
## Call out to required libraries
library(ggplot2)
## 
NEI_bal <- subset(NEI, fips=="24510") ## Dataset for Baltimore city

## Split sum by years and plot
sum_year_bal<- aggregate(Emissions ~ year + type, data=NEI_bal, sum)

colnames(sum_year_bal)<-c("type","year","emissions")
ggplot(sum_year_bal , aes(x=factor(year),y=emissions,group=type)) + geom_line(aes(colour=type)) +
  ggtitle("Emissions in Baltimore City") + labs(x = "Years", y="Emissions")