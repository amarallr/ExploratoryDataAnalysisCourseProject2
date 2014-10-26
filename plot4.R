#==============================================================================
# LUCAS RODRIGUES AMARAL
#==============================================================================
# Function plot4(): 
# Across the United States, how have emissions from coal combustion-related 
# sources changed from 1999–2008?
#==============================================================================
plot4 <- function() {
        
        
        # Test if the dataset has been already created.
        if(!exists("dsPlot4")) {
                
                print("Reading plot4 dataset ...")
                
                dsPlot4 <<- sqldf("select       a.year          as year
                                                ,sum(Emissions) as Emissions 
                                  from          dsNEI a, 
                                                dsSCC b 
                                  where         a.SCC = b.SCC
                                        and     lower(EI_Sector) like '%coal%'
                                  group by      year
                                  order by      year", 
                                  drv='SQLite')
                

        }
        
        par(mfrow = c(1, 1))
        
        png(file=".\\plot4.png")

        # Creates the plot
        p <- qplot(x=year, 
                   y=Emissions, 
                   data=dsPlot4,
                   geom=c("point", "line"),
                   xlab="Year", 
                   ylab="Emissions:Amount of PM2.5 emitted, in tons",
                   main="Coal Related PM2.5 Emissions from 1999 to 2008")
        
        print(p)
        
        
        dev.off()
}
