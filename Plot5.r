## Load in data into R
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Create Dataset
NEI_B <- subset(NEI, fips=="24510") 

## Automotive emissons 
moto_index <- which(regexpr("Vehicles", SCC$Short.Name)>0)
moto_SCC <- SCC$SCC[moto_index]
NEI_B_moto <- NEI_B[NEI_B$SCC%in%moto_SCC,]

## Format and plot data
emi_V <- aggregate(Emissions ~ year, data=NEI_B_moto, sum)
plot(emi_v, xlab="year", ylab="PM2.5 Emission(Tons)", 
     main="Total Emission Change by Vehicle in Baltimore", xaxt="n")
axis(1, at=1999:2008)

## Write plot
dev.copy(png, file="plot5.png")
dev.off()