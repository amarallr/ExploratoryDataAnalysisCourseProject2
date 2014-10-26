#==============================================================================
# LUCAS RODRIGUES AMARAL
#==============================================================================
# Function plot3(): 
# Of the four types of sources indicated by the type (point, nonpoint, onroad, 
# nonroad) variable, which of these four sources have seen decreases in 
# emissions from 1999–2008 for Baltimore City? Which have seen increases in 
# emissions from 1999–2008? Use the ggplot2 plotting system to make a plot 
# answer this question.
#==============================================================================
plot3 <- function() {
        
        par(mfrow = c(1, 1))
        
        png(file=".\\plot3.png")
        
        # Test if the dataset has been already created.
        if(!exists("dsPlot3")) {
                
                print("Reading plot3 dataset ...")
                
                dsPlot3 <<- sqldf("select       year,
                                                type as typeOfSource,
                                                sum(Emissions) as Emissions 
                                  from          dsNEI 
                                  where         fips = '24510'
                                  group by      year, typeOfSource 
                                  order by      year, typeOfSource")        
                
        }
        
        par(mfrow = c(1, 1))
        
        png(file=".\\plot3_.png")
        
        # Creates the plot
        p <- qplot(x=year, 
                   y=Emissions, 
                   data=dsPlot3,
                   col=typeOfSource,
                   geom=c("point", "line"),
                   xlab="Year", 
                   ylab="Emissions:  Amount of PM2.5 emitted, in tons",
                   main="Total emissions of PM2.5 in Baltimore City, Maryland, 
                   from 1999 to 2008, by Type of Source")
        
        print(p)
        
        dev.off()
}
