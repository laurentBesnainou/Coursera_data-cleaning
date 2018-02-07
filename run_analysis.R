#run_analysis.R
library(dplyr)
library(tidyr)


#loading Activity and features tables 
activities <- read.table('activity_labels.txt')
features <- read.table('features.txt')

#function to load data
loadData <- function (rep){
  filex <- paste0(rep,"/X_",rep,".txt")
  filey <- paste0(rep,"/y_",rep,".txt")
  x <- read.table(filex)
  y <- read.table(filey)
  yLabels <- merge(y,activities,by.x="V1",by.y="V1")
  #put colomns names
  names(x) <- features$V2
  names(yLabels) <- c("activity","activityname")
  trainData <- cbind(yLabels,x)
}

#Loading Training Data
testData <- loadData("test")
trainData<- loadData("train")
#adding the type of data
testData$type <- "test"
trainData$type <- "train"
#merge the data
mergeData <- rbind(testData,trainData)

#get only mean and std columns
nameCol <- names(mergeData)
elementMean <- grep("mean\\(\\)-[XYZ]$",nameCol)
elementStd <- grep("std\\(\\)-[XYZ]$",nameCol)
elementActivityType <- grep("activityname|type",nameCol)
lstColmuns <- c(elementActivityType,elementMean,elementStd)
df <- mergeData[,lstColmuns]
write.csv(df,"tidyDataframe.csv")

#add the subject to dataframe
subjecttrain <- read.table('train/subject_train.txt')
subjecttest <- read.table('test/subject_test.txt')
subject <- rbind(subjecttest,subjecttrain)
names(subject) <- "subject"
dfSubject <- cbind(subject,df)
dfSubject$subject <- factor(dfSubject$subject )
dfSubject$type <- NULL
#Gather the dataframe to calculate the mean on each columns
dfgather <- dfSubject %>% gather(variable, value, -subject, -activityname)
dfAvg <- dfgather %>% group_by(activityname,subject,variable) %>% summarise(average=mean(value,na.rm = TRUE))

#spreading the result to store in a new dataframe
dfSpread <- dfAvg %>% spread(variable, average)
write.csv(dfSpread,"AVGDataframe.csv")

