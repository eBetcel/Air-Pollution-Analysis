#Calculates the mean of polutant
pollutantmean <- function(directory, pollutant, id = 1:332) {
    
    #Get all the files names from selected IDs
    files <- list.files(directory)[id]
    #Create DataFrame
    df <- data.frame()
    #For loop to read all .csv files with selected id and bind to df 
    for(i in files){
        df <-rbind(df, read.csv(paste0(getwd(),"/",directory,"/",i)))
    }
    #Returns the mean of pollutant column
    return(mean(df[,pollutant], na.rm = TRUE))
}

complete <- function(directory, id = 1:332){
    #Gets all the files names and saves to a list
    files <- list.files(directory)
    #Creates DataFrame
    df <- data.frame()
    for (i in id){
        #Reads files
        data <- read.csv(paste0(getwd(),"/",directory,"/",files[i]))
        #Sum all non null observations
        nobs <- sum(complete.cases(data)) 
        df <- rbind(df, data.frame(i,nobs))
    }
    #Set dataframe column names
    colnames(df) <- c("id", "nobs")
    return(df)
}

corr <- function(directory, threshold = 0){
    #Creates numeric vector
    correlation_results <- numeric(0)
    #Creates data frame and fills it with complete cases
    complete_df <- complete(directory)
    complete_df <- complete_df[complete_df["nobs"]>=threshold,]
    for (i in complete_df$id){
        #Reads files
        m_data<- read.csv(paste0(getwd(),"/",directory,"/",sprintf("%03d", i),".csv"))
        relevant_data <- m_data[(!is.na(m_data["sulfate"])), ]
        relevant_data <- relevant_data[(!is.na(relevant_data["nitrate"])), ]
        sulfate <- relevant_data["sulfate"]
        nitrate <- relevant_data["nitrate"]
        correlation_results <- c(correlation_results, cor(sulfate, nitrate))
    }
    correlation_results
}
    

