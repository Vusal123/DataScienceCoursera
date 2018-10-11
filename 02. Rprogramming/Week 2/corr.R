corr<-function(directory, threshold = 0){

 #'directory' is a character vector of length 1 indicating 
 ## the location of the CSV files
 
 ## 'threshold' is a numeric vector of length 1 indicating the
 ## number of completely observed observations (on all variables)
 ## required to compute the correlation between
 ## nitrate and sulfate; the default is 0
 
 ## Return a numberic vector of correlations
 
 ##set working directory
  if(directory=="specdata"){
    directory<-("./specdata/")
  }
    
  ## find all files in the specdata folder
  all_files<-as.character(list.files(directory))
  ##collect files to 
  file_paths<-paste(directory, all_files, sep="")
  
  #idenify id' based on threshold for completely observed observations
  all_nobs<-complete("specdata",1:332)
  ids<-c(all_nobs[all_nobs[,"nobs"]>threshold,"id"])
  
  ##initialize correlation vector
  corr_vector<-vector(mode="numeric", length=0)
  
  ##Loop through files to analyze
  for(i in ids) {
    ##read required csv file
	current_file <- read.csv(file_paths[i], header=TRUE, sep=",")
	
	##run correlation
	corr_data<-cor(current_file[["sulfate"]], current_file[["nitrate"]], use="pairwise.complete.obs")
	
	##collect correlation data for each id to the corr_vector
	corr_vector<-c(corr_vector,corr_data)
  }
  
  return(corr_vector)
  
 }
 