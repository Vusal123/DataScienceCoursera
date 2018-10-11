complete<-function(directory, id = 1:332){
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of the complete cases
  
  ##set working directory
  if(directory=="specdata"){
    directory<-("./specdata/")
  }
  
  ##initialize result
  final_matrix<-matrix(ncol=2)
  colnames(final_matrix)<-c("id","nobs")
  
  ## find all files in the specdata folder
  all_files<-as.character(list.files(directory))
  ##collect files to 
  file_paths<-paste(directory, all_files, sep="")
  
  for(i in id) {
    data_vector<-c()
    current_file <- read.csv(file_paths[i], header=TRUE, sep=",")
    all_data<-current_file[,"sulfate"]
    data_vector <- na.omit(c(data_vector,all_data))
	final_matrix<-rbind(final_matrix,c(i,length(data_vector)))
  }
  final_matrix<-final_matrix[complete.cases(final_matrix), ]
  result<-data.frame(id=final_matrix[,"id"],nobs=final_matrix[,"nobs"])
  return(result)
}