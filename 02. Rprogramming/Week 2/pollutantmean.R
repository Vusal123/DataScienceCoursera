pollutantmean<-function(directory, pollutant, id = 1:332){
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  
  ##set working directory
  if(directory=="specdata"){
    directory<-("./specdata/")
  }
  
  ##initialize vector for pollutant data
  data_vector<-c()
  
  ## find all files in the spec data
  all_files<-as.character(list.files(directory))
  
  ##collect files to 
  file_paths<-paste(directory, all_files, sep="")
  
  ##collect required rollutant data to data_vector based on id
  for(i in id) {
    current_file <- read.csv(file_paths[i], header=TRUE, sep=",")
    polutant_data<-current_file[,pollutant]
    data_vector <- c(data_vector,polutant_data)
  }
  ## remove NA values
  mean_vector<-na.omit(data_vector)
  
  ##return mean value
  return(mean(mean_vector))
}
