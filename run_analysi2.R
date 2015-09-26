
## SECTION 1A - Read Data
## ------------------------
## Read TEST Data
X_test<-read.table("X_test.txt")
Y_test<-read.table("Y_test.txt")
subj_test<-read.table("subject_test.txt")

## Read TRAIN Data
X_train<-read.table("X_train.txt")
Y_train<-read.table("Y_train.txt")
subj_train<-read.table("subject_train.txt")

## Read ACTIVITY Data
Activities<-read.table("activity_labels.txt",stringsAsFactors = FALSE)

## Read FEATURE DATA
features<-read.table("features.txt",stringsAsFactors = FALSE)

## SECTION 1B - Combine Data
## -----------------------------
## combine the data
test_combined<-cbind(subj_test,Y_test,X_test)
train_combined<-cbind(subj_train,Y_train,X_train)
allData<-rbind(test_combined,train_combined)

## SECTION 1C - Extract and Label
## -----------------------------

## Extract relevant columns
colNames<-c("Subject","Activity",features[,2])
RetrieveIndex<-c(1,2,grep("mean\\(|std\\(",colNames))
selectedData<-allData[,RetrieveIndex]
                      
## Fix and apply column names  
colNames<-colNames[RetrieveIndex]
colNames<-gsub("\\(\\)","",colNames)
colNames<-gsub("-","_",colNames)
names(selectedData)<-colNames

## Apply escriptive name for Activities
selectedData[,2]<-factor(selectedData[,2],labels=Activities[,2])

## SECTION 2 - Summarize Data
## -----------------------------
require(ddply)
MeanData<-ddply(selectedData,.(Subject,Activity),colwise(mean))

DataColumnNames<-names(selectedData)[-(1:2)]
names(MeanData)<-c("Subject","Actvitity",paste(DataColumnNames,"_mean",sep=""))

write.table(MeanData,file="MeanData.txt",row.name=FALSE)
