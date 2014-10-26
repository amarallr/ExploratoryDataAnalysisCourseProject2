#==============================================================================
# LUCAS RODRIGUES AMARAL
#==============================================================================
# Function plot2(): 
# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland 
# (fips == "24510") from 1999 to 2008? Use the base plotting system to make a 
# plot answering this question.
#==============================================================================
plot2 <- function() {
        
        # Test if the dataset has been already created.
        if(!exists("dsPlot2")) {
                
                print("Reading plot2 dataset ...")
                
                dsPlot2 <<- sqldf("select       year, 
                                                sum(Emissions) as Emissions 
                                  from          dsNEI 
                                  where         fips = '24510'
                                  group by      year 
                                  order by      year")        
                
        }
        
        par(mfrow = c(1, 1))
        
        png(file=".\\plot2.png")

        # Creates the plot
        plot(dsPlot2$year, dsPlot2$Emissions, type="b", col="blue", xlab="Year", 
             ylab="Emissions:  Amount of PM2.5 emitted, in tons",
             main="Total emissions of PM2.5 in Baltimore City, Maryland, 
             from 1999 to 2008")
        
        dev.off()
}
