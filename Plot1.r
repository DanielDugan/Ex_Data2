## Read data into R
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
 
## the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.
sum <- aggregate(Emissions ~ year, data = NEI, sum)
  
## Create Barplot (Plot1) from data
png(file = "plot1.png", width=480, height=480)
bp <- barplot(height = sum$Emissions, names.arg = sum$year,
+               xlab = "Years", ylab = expression(paste("Total  ",PM [2],"  Emission")),
+               main = expression(paste("Total Emissions from ", PM[2]," decreased in the U.S.")))
text(x = bp, y = sum$Emissions, labels = round(sum$Emissions, digits = 0), cex=1, pos=1)
 dev.off()