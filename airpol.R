
#Calculates the mean of polutant
pollutantmean <- function(directory, pollutant, id = 1:332) {
    
    #Get all the files names from selected IDs
    files <- list.files(directory)[id]
    #Creating DataFrame
    df <- data.frame()
    #For loop to read all .csv files with selected id and bind to df 
    for(i in files){
        df <-rbind(df, read.csv(paste0(getwd(),"/",directory,"/",i)))
    }
    #Returns the mean of pollutant column
    mean(df[,pollutant], na.rm = TRUE)
}

