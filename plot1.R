#==============================================================================
# LUCAS RODRIGUES AMARAL
#==============================================================================
# Function plot1(): 
# Have total emissions from PM2.5 decreased in the United States from 1999 to 
# 2008? Using the base plotting system, make a plot showing the total PM2.5 
# emission from all sources for each of the years 1999, 2002, 2005, and 2008.
#==============================================================================
plot1 <- function() {

        # Test if the dataset has been already created.
        if(!exists("dsPlot1")) {

                print("Reading plot1 dataset ...")
                
                dsPlot1 <<- sqldf("select       year, 
                                                sum(Emissions) as Emissions 
                                  from          dsNEI 
                                  group by      year 
                                  order by      year")        
                
        }
        par(mfrow = c(1, 1))
        
        png(file=".\\plot1.png")
        
        # Creates the plot
        plot(dsPlot1$year, dsPlot1$Emissions, type="b", col="blue", xlab="Year", 
             ylab="Emissions:  Amount of PM2.5 emitted, in tons",
             main="Total emissions of PM2.5 in the United States from 1999 to 2008")

        dev.off()
}

