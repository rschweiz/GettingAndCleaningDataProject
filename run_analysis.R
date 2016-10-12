library(dplyr)

#download dataset
zipfile <- file.path("data","dataset.zip")
#create data directory
if (!file.exists("data")) {
    dir.create("data")
}

#download zip file
if (!file.exists(zipfile)) {
    url1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(url1,zipfile,method ="libcurl")
}

#get activity labels
actLabels <- read.table(
                unz(zipfile,file.path("UCI HAR Dataset","activity_labels.txt")),
                sep=" ")

#get the feature descriptions
featureNames <- read.table(
                    unz(zipfile,file.path("UCI HAR Dataset","features.txt")),
                    sep=" ")

#find indicies of "mean" and "std" features
ix <- grep(".*(mean|std).*",featureNames[[2]])
colNames <- featureNames[[2]][ix]
   
#read the test data
fpath <- file.path("UCI HAR Dataset","test","subject_test.txt")
subjecttest <- read.table(unz(zipfile,fpath), header = FALSE) %>% tbl_df()
fpath <- file.path("UCI HAR Dataset","test","X_test.txt")
xtest <- read.table(unz(zipfile,fpath), header = FALSE)[,ix] %>% tbl_df()
fpath <- file.path("UCI HAR Dataset","test","y_test.txt")
ytest <- read.table(unz(zipfile,fpath), header = FALSE) %>% tbl_df()

#read the training data
fpath <- file.path("UCI HAR Dataset","train","subject_train.txt")
subjecttrain <- read.table(unz(zipfile,fpath), header = FALSE) %>% tbl_df()
fpath <- file.path("UCI HAR Dataset","train","X_train.txt")
xtrain <- read.table(unz(zipfile,fpath), header = FALSE)[,ix] %>% tbl_df()
fpath <- file.path("UCI HAR Dataset","train","y_train.txt")
ytrain <- read.table(unz(zipfile,fpath), header = FALSE) %>% tbl_df()

#add column names
names(xtest) <- colNames
names(xtrain) <- colNames

#add subject and activity information
xtrain <- cbind( as.data.frame(  actLabels[[2]][ytrain[[1]]] ),
                  as.data.frame( subjecttrain[[1]] ),
                  xtrain)
names(xtrain)[1:2] <- c("activity","subject")


xtest <- cbind( as.data.frame(  actLabels[[2]][ytest[[1]]] ),
                 as.data.frame( subjecttest[[1]] ),
                xtest)
names(xtest)[1:2] <- c("activity","subject")

#merge the test and training datasets
motionData <- bind_rows(xtrain,xtest)

#create a second data set with the average of each variable
#for each activity and each subject.
motionDataAveraged <- group_by(motionData,activity,subject) %>%
                    summarise_each(funs(mean(., na.rm=TRUE)) )

write.csv(motionData,file.path("data","motionData.csv"))
write.csv(motionDataAveraged,file.path("data","motionDataAveraged.csv"))
