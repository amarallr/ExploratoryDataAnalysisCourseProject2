#==============================================================================
# LUCAS RODRIGUES AMARAL
#==============================================================================
# Function plot6(): 
# Compare emissions from motor vehicle sources in Baltimore City with emissions 
# from motor vehicle sources in Los Angeles County, California (fips == "06037"
# ). Which city has seen greater changes over time in motor vehicle emissions?
#==============================================================================
plot6 <- function() {
        
        
        # Test if the dataset has been already created.
        if(!exists("dsPlot6")) {
                
                print("Reading plot6 dataset ...")
                
                dsPlot6 <<- sqldf("select       a.year                  as year
                                                , case(a.fips)
                                                        when '24510' then 'Baltimore City, Maryland'
                                                        when '06037' then 'Los Angeles County, California'
                                                        end             as city
                                                ,sum(a.Emissions)       as Emissions 
                                  from          dsNEI a 
                                                ,dsSCC b 
                                  where         a.SCC = b.SCC
                                          and   lower(b.EI_Sector) like '%vehicles%'
                                          and   a.fips in ('06037', '24510')
                                  group by      a.year 
                                                ,city
                                  order by      a.year
                                                ,city", 
                                  drv='SQLite')
                
        }
        
        par(mfrow = c(1, 1))
        
        png(file=".\\plot6.png")

        # Creates the plot
        p <- qplot(x=year, 
                   y=Emissions, 
                   data=dsPlot6,
                   col=city,
                   geom=c("point", "line"),
                   xlab="Year", 
                   ylab="Emissions:Amount of PM2.5 emitted, in tons",
                   main="Motor Vehicle PM2.5 Emissions from 1999 to 2008")
        
        print(p)
        
        
        dev.off()
}
