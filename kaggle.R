# Load the Training dataset
train = read.csv("NYTimesBlogTrain.csv", stringsAsFactors=FALSE)
popular <- subset(train,train$Popular==1)

# Load the Test dataset
test= read.csv("NYTimesBlogTest.csv", stringsAsFactors=FALSE)

# Extract Date and time for Training and Test Data
train$date= as.Date(strptime(train$PubDate, "%Y-%m-%d %H:%M:%S"))
train$Weekday<- weekdays(as.Date(train$PubDate))
train$hour <- strftime(strptime(train$PubDate, "%Y-%m-%d %H:%M:%S"), '%H')
test$hour <- strftime(strptime(test$PubDate, "%Y-%m-%d %H:%M:%S"), '%H')
test$date= as.Date(strptime(test$PubDate, "%Y-%m-%d %H:%M:%S"))
test$Weekday<- weekdays(as.Date(test$PubDate))

# Text Analytics for Headline
library(tm)
corpus = Corpus(VectorSource(train$Headline))
corpus[[1]]
# Pre-process data
corpus = tm_map(corpus, tolower)
# IMPORTANT NOTE: If you are using the latest version of the tm package, you will need to run the following line before continuing (it converts corpus to a Plain Text Document). This is a recent change having to do with the tolower function that occurred after this video was recorded.
corpus = tm_map(corpus, PlainTextDocument)
corpus = tm_map(corpus, removePunctuation)
corpus = tm_map(corpus, removeWords, stopwords("english"))
corpus = tm_map(corpus, stemDocument, language="english")
corpus[[1]]
dtm = DocumentTermMatrix(corpus)
dtm
# Remove sparse terms
dtm = removeSparseTerms(dtm, 0.988)
dtm
labeledTerms = as.data.frame(as.matrix(dtm))

# Text Analytics for Snippet

corpus_Snippet = Corpus(VectorSource(train$Snippet))
corpus_Snippet [[1]]
# Pre-process data
corpus_Snippet  = tm_map(corpus_Snippet , tolower)
# IMPORTANT NOTE: If you are using the latest version of the tm package, you will need to run the following line before continuing (it converts corpus to a Plain Text Document). This is a recent change having to do with the tolower function that occurred after this video was recorded.
corpus_Snippet  = tm_map(corpus_Snippet , PlainTextDocument)
corpus_Snippet  = tm_map(corpus_Snippet , removePunctuation)
corpus_Snippet  = tm_map(corpus_Snippet , removeWords, stopwords("english"))
corpus_Snippet  = tm_map(corpus_Snippet , stemDocument, language="english")
corpus_Snippet [[1]]
dtm2 = DocumentTermMatrix(corpus_Snippet )
dtm2
# Remove sparse terms
dtm2 = removeSparseTerms(dtm2, 0.98)
dtm2
labeledTerms2 = as.data.frame(as.matrix(dtm2))

# Text Analytics for Abstract

corpus_Abstract = Corpus(VectorSource(train$Abstract))
corpus_Abstract [[1]]
# Pre-process data
corpus_Abstract  = tm_map(corpus_Abstract , tolower)
# IMPORTANT NOTE: If you are using the latest version of the tm package, you will need to run the following line before continuing (it converts corpus to a Plain Text Document). This is a recent change having to do with the tolower function that occurred after this video was recorded.
corpus_Abstract  = tm_map(corpus_Abstract , PlainTextDocument)
corpus_Abstract  = tm_map(corpus_Abstract, removePunctuation)
corpus_Abstract  = tm_map(corpus_Abstract, removeWords, stopwords("english"))
corpus_Abstract  = tm_map(corpus_Abstract , stemDocument, language="english")
corpus_Abstract[[1]]
dtm3 = DocumentTermMatrix(corpus_Abstract)
dtm3
# Remove sparse terms
dtm3 = removeSparseTerms(dtm3, 0.98)
dtm3
labeledTerms3 = as.data.frame(as.matrix(dtm3))

# Merging bag of words from Snippet,Abstract,Headline in Test Data
final <- cbind(labeledTerms,labeledTerms2,labeledTerms3)

# Text Analytics for Headline in Test Data

corpus_Snippet2 = Corpus(VectorSource(test$Headline))
corpus_Snippet2 [[1]]
# Pre-process data
corpus_Snippet2  = tm_map(corpus_Snippet2 , tolower)
# IMPORTANT NOTE: If you are using the latest version of the tm package, you will need to run the following line before continuing (it converts corpus to a Plain Text Document). This is a recent change having to do with the tolower function that occurred after this video was recorded.
corpus_Snippet2  = tm_map(corpus_Snippet2 , PlainTextDocument)
corpus_Snippet2  = tm_map(corpus_Snippet2 , removePunctuation)
corpus_Snippet2  = tm_map(corpus_Snippet2 , removeWords, stopwords("english"))
corpus_Snippet2  = tm_map(corpus_Snippet2 , stemDocument, language="english")
corpus_Snippet2 [[1]]
dtm2 = DocumentTermMatrix(corpus_Snippet2 )
dtm2
# Remove sparse terms
dtm2 = removeSparseTerms(dtm2, 0.988)
dtm2
labeledTerms_test = as.data.frame(as.matrix(dtm2))

# Text Analytics for Snippet in Test Data

corpus_Snippet2 = Corpus(VectorSource(test$Snippet))
corpus_Snippet2 [[1]]
# Pre-process data
corpus_Snippet2  = tm_map(corpus_Snippet2 , tolower)
# IMPORTANT NOTE: If you are using the latest version of the tm package, you will need to run the following line before continuing (it converts corpus to a Plain Text Document). This is a recent change having to do with the tolower function that occurred after this video was recorded.
corpus_Snippet2  = tm_map(corpus_Snippet2 , PlainTextDocument)
corpus_Snippet2  = tm_map(corpus_Snippet2 , removePunctuation)
corpus_Snippet2  = tm_map(corpus_Snippet2 , removeWords, stopwords("english"))
corpus_Snippet2  = tm_map(corpus_Snippet2 , stemDocument, language="english")
corpus_Snippet2 [[1]]
dtm2 = DocumentTermMatrix(corpus_Snippet2 )
dtm2
# Remove sparse terms
dtm2 = removeSparseTerms(dtm2, 0.98)
dtm2
labeledTerms_test2 = as.data.frame(as.matrix(dtm2))

# Text Analytics for Abstract in test Data

corpus_Snippet2 = Corpus(VectorSource(test$Abstract))
corpus_Snippet2 [[1]]
# Pre-process data
corpus_Snippet2  = tm_map(corpus_Snippet2 , tolower)
# IMPORTANT NOTE: If you are using the latest version of the tm package, you will need to run the following line before continuing (it converts corpus to a Plain Text Document). This is a recent change having to do with the tolower function that occurred after this video was recorded.
corpus_Snippet2  = tm_map(corpus_Snippet2 , PlainTextDocument)
corpus_Snippet2  = tm_map(corpus_Snippet2 , removePunctuation)
corpus_Snippet2  = tm_map(corpus_Snippet2 , removeWords, stopwords("english"))
corpus_Snippet2  = tm_map(corpus_Snippet2 , stemDocument, language="english")
corpus_Snippet2 [[1]]
dtm2 = DocumentTermMatrix(corpus_Snippet2 )
dtm2
# Remove sparse terms
dtm2 = removeSparseTerms(dtm2, 0.9798)
dtm2
labeledTerms_test3 = as.data.frame(as.matrix(dtm2))

# Merging bag of words from Snippet,Abstract,Headline in Test Data

final2 <- cbind(labeledTerms_test,labeledTerms_test2,labeledTerms_test3)


# Preparing common independent variables in Test and Training Data
matchingNames <- names(final)[names(final) %in% names(final2)]
matchingNames
final <-final[, matchingNames]
final2 <-final2[, matchingNames]
finaltrain <- cbind(final,data.frame
                    (train$NewsDesk,train$SectionName,train$WordCount,train$Popular,
                     train$Subsection,train$date,train$Weekday))
finaltest <- cbind(final2,data.frame
                   (test$NewsDesk,test$SectionName,test$WordCount,
                    test$Subsection,test$date,test$Weekday))
head(finaltrain[124],10)
ncol(finaltest)
colnames(finaltrain)[ncol(finaltrain)-6] <-"NewsDesk"
colnames(finaltrain)[ncol(finaltrain)-5] <-"SectionName"
colnames(finaltrain)[ncol(finaltrain)-4] <-"WordCount"
colnames(finaltrain)[ncol(finaltrain)-3] <-"Popular"
colnames(finaltrain)[ncol(finaltrain)-2] <-"Subsection"
colnames(finaltrain)[ncol(finaltrain)-1] <-"date"
colnames(finaltrain)[ncol(finaltrain)]<-"Weekday"
colnames(finaltest)[ncol(finaltest)-5] <-"NewsDesk"
colnames(finaltest)[ncol(finaltest)-4] <-"SectionName"
colnames(finaltest)[ncol(finaltest)-3] <-"WordCount"
colnames(finaltest)[ncol(finaltest)-2] <-"Subsection"
colnames(finaltest)[ncol(finaltest)-1] <-"date"
colnames(finaltest)[ncol(finaltest)]<-"Weekday"
finaltrain$hour <- train$hour
finaltest$hour <- test$hour
summary(finaltrain)

finaltrain$WordCount <- log(finaltrain$WordCount+1)
finaltest$WordCount <- log(finaltest$WordCount+1)

# Logistic Regression Model
logistic3 = glm(Popular ~., data = finaltrain, family=binomial)

predicttest = predict(logistic3,,newdata=finaltest,type="response")
submission <- data.frame(test$UniqueID, predicttest)
colnames(submission) <- c("UniqueID","Probability1")
write.csv(submission, file="submission10.csv",col.names = FALSE,row.names=FALSE)
