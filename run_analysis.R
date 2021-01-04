
library(dplyr)

### read in train/test sets and merge each into one table - one for predictors, subjects, and response variable
X.values = read.table("X_test.txt",header=FALSE)
X.values = rbind(X.values,read.table("X_train.txt",header=FALSE))
y.values = read.table("y_test.txt",header=FALSE)
y.values = rbind(y.values,read.table("y_train.txt",header=FALSE))
subjects = read.table("subject_test.txt",header=FALSE)
subjects = rbind(subjects,read.table("subject_train.txt",header=FALSE))
activity.labels = read.table("activity_labels.txt",header=FALSE)
features.list = read.table("features.txt",header=FALSE)

### Assign Descriptive Variable names
colnames(X.values) = features.list$V2
colnames(y.values) = "Activity"
colnames(subjects) = "Subject ID"

#Set Subject ID as a factor
subjects$`Subject ID`= as.factor(subjects$`Subject ID`)
labels = activity.labels$V2

### Reduce X variables into only interested variables - in this case mean and standard deviation
mean.sd = grep("mean()|sd()",features.list$V2)
x.values.concern = X.values[,mean.sd]

### Combine all data tables into one dataframe 
complete.data = cbind(subjects,y.values,x.values.concern)

### Create factor variables for response variables
complete.data = arrange(complete.data,complete.data$Activity)
complete.data$Activity = as.factor(complete.data$Activity)
levels(complete.data$Activity) = labels

### Renaming Variables with descriptive definition
names(complete.data) = gsub("tBody","(In time) Body ",names(complete.data))
names(complete.data) = gsub("tGravity","(In time) Gravity ",names(complete.data))
names(complete.data) = gsub("fBodyBody","fBody",names(complete.data))
names(complete.data) = gsub("fBody","(In frequency) Body ",names(complete.data))
names(complete.data) = gsub("fGravity","(In frequency) Gravity ",names(complete.data))
names(complete.data) = gsub("Acc","acceleration signal from accelerometer",names(complete.data)) 
names(complete.data) = gsub("Gyro","acceleration signal from gyroscope",names(complete.data))
names(complete.data) = gsub("Mag-"," applied to Fast Fourier Transform ",names(complete.data))
names(complete.data) = gsub("Jerk"," [Jerk signal]",names(complete.data))
names(complete.data) = gsub("mean\\(\\)"," Mean",names(complete.data))
names(complete.data) = gsub("meanFreq\\(\\)"," Mean Freq.",names(complete.data))
names(complete.data) = gsub("sd\\(\\)"," Std.",names(complete.data))
names(complete.data) = gsub("-X"," of X dim",names(complete.data))
names(complete.data) = gsub("-Y"," of Y dim",names(complete.data))
names(complete.data) = gsub("-Z"," of Z dim",names(complete.data))

# Creating Summarized datatable by Subject ID and Activity -- Question 5 
Tidy.df = complete.data %>% group_by(`Subject ID`,Activity) %>%  summarise_if(is.numeric, mean, na.rm = TRUE)
Tidy.df = arrange(Tidy.df,Tidy.df$`Subject ID`)

# Write the datatable
write.csv(Tidy.df,"Summarized Tidy Dataframe.csv")

