
#Calculates the mean of polutant
pollutantmean <- function(directory, pollutant, id = 1:332) {
    
     #Get all the files names from selected IDs
    files <- list.files(directory)[id]
     #Creating DataFrame
    df <- data.frame()
    print(files[1])
    print(files[2])
    print(files[3])
    for(i in id){
        df <-rbind(df, read.table(paste0(getwd(),"/",directory,"/",files[i])))
        
    }
    print(df)
}

