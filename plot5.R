#==============================================================================
# LUCAS RODRIGUES AMARAL
#==============================================================================
# Function plot5(): 
# How have emissions from motor vehicle sources changed from 1999–2008 in 
# Baltimore City?
#==============================================================================
plot5 <- function() {
        
        
        # Test if the dataset has been already created.
        if(!exists("dsPlot5")) {
                
                print("Reading plot5 dataset ...")
                
                dsPlot5 <<- sqldf("select       a.year                  as year
                                                ,sum(a.Emissions)       as Emissions 
                                  from          dsNEI a 
                                                ,dsSCC b 
                                  where         a.SCC = b.SCC
                                        and     lower(b.EI_Sector) like '%vehicles%'
                                        and     fips = '24510'
                                  group by      a.year
                                  order by      a.year", 
                                  drv='SQLite')
                
        }
        
        par(mfrow = c(1, 1))
        
        png(file=".\\plot5.png")

        # Creates the plot
        p <- qplot(x=year, 
                   y=Emissions, 
                   data=dsPlot5,
                   geom=c("point", "line"),
                   xlab="Year", 
                   ylab="Emissions:Amount of PM2.5 emitted, in tons",
                   main="Motor Vehicle PM2.5 Emissions from 1999 to 2008 \nBaltimore City, Maryland")
        
        print(p)
        
        
        dev.off()
}
