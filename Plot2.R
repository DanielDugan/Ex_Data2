## Read in data for total emissions from PM2.5 decreased in the Baltimore.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Create Dataset for Plot
NEI_bal <- subset(NEI, fips=="24510") 

## Format and plot data
sum_year_bal <- aggregate(Emissions ~ year, data=NEI_bal, sum)

plot(sum_year_bal, xlab="Year", ylab="PM2.5 Emission(Tons)", 
     main="Total Emission Change in Baltimore", xaxt="n")
axis(1, at=1999:2008)
## Generate Plot
dev.copy(png, file="plot2.png")
dev.off()