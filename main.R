source("plot1.R")
source("plot2.R")
source("plot3.R")
source("plot4.R")
source("plot5.R")
source("plot6.R")

library(sqldf)
library(ggplot2)

#==============================================================================
# Funcion readDataset(): reads the dataset project files.
#==============================================================================
readDataset <- function() {
        
        # Reads the file that contains a data frame with all of the PM2.5 
        # emissions data for 1999, 2002, 2005, and 2008. For each year, the 
        # table contains number of tons of PM2.5 emitted from a specific type 
        # of source for the entire year.
        
        if(!exists("dsNEI")) {
                print("Reading file summarySCC_PM25.rds ...")
                dsNEI <<- readRDS("summarySCC_PM25.rds")
        }
        
        
        # Reads the file with the mapping from the SCC digit strings in the 
        # Emissions table to the actual name of the PM2.5 source. The sources 
        # are categorized in a few different ways from more general to more 
        # specific and you may choose to explore whatever categories you think 
        # are most useful. For example, source “10100101” is known as 
        # “Ext Comb /Electric Gen /Anthracite Coal /Pulverized Coal”.
        
        if(!exists("dsSCC")) {
                
                print("Reading file Source_Classification_Code.rds ...")
                dsSCC <<- readRDS("Source_Classification_Code.rds")
                
                # Replaces "." with "_"
                names(dsSCC) <<- gsub(".", "_", names(dsSCC), fixed=TRUE)
        }
        
        return(TRUE)
}



#==============================================================================
# Funcion main(): main code that calls the other functions plot1(), plot2(),
# plot3(), plot4(), plot5() and plot6().
#==============================================================================
main <- function() {
        print("Reading the dataset project files ...")
        readDataset()       
        
        print("Printing plot 1 ...")
        plot1()       

        print("Printing plot 2 ...")
        plot2()       

        print("Printing plot 3 ...")
        plot3()       
        
        print("Printing plot 4 ...")
        plot4()       
        
        print("Printing plot 5 ...")
        plot5()       
        
        print("Printing plot 6 ...")
        plot6()       
}