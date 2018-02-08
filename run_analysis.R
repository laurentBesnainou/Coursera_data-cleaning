#run_analysis.R
library(dplyr)
library(tidyr)

############################################ Loading the files
##############################################################
#loading Activity and features tables 
activities <- read.table('activity_labels.txt')
features <- read.table('features.txt')

#function to load data
loadData <- function (rep){
  filex <- paste0(rep,"/X_",rep,".txt")
  filey <- paste0(rep,"/y_",rep,".txt")
  filesubject <- paste0(rep,"/subject_",rep,".txt")
  x <- read.table(filex)
  y <- read.table(filey)
  subject <- read.table(filesubject)
  names(subject) <- "subject"
  yLabels <- left_join(y, activities, by = c("V1" = "V1"))
  #put colomns names
  names(x) <- features$V2
  names(yLabels) <- c("activity","activityname")
  cbind(subject,yLabels,x)
}


#Loading Training Data
testData <- loadData("test")
trainData<- loadData("train")

#################################### Merge Test and Train Data
##############################################################
#merge the data
mergeData <- rbind(testData,trainData)


############################### Getting all mean, std columns
############################### plus subject and activityname
##############################################################
nameCol <- names(mergeData)
lstColmuns <- grepl("subject|activityname|mean\\(\\)|std\\(\\)", nameCol)
df <- mergeData[,lstColmuns]


##################### Calculate mean of each colum groupy by 
##################### group by activity name and subject
##############################################################
df$subject <- factor(df$subject )

dfAvg <- df %>% group_by(activityname,subject) %>% 
  summarise_all(funs(mean))

##################### export the data as the result  
##############################################################
write.table(dfSpread,"AVGDataframe.txt",row.name=FALSE)


