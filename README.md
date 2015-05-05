This Competition was organized by Analytics Edge .Many blog articles are published each day, and the New York Times has to 
decide which articles should be featured. In this competition, the challenge was to develop an analytics model that will help 
the New York Times understand the features of a blog post that make it popular.

The independent variables in training data set consisted of 8 pieces of article data available at the time of publication, 
and a unique identifier 
•	NewsDesk = the New York Times desk that produced the story (Business, Culture, Foreign, etc.)
•	SectionName = the section the article appeared in (Opinion, Arts, Technology, etc.)
•	SubsectionName = the subsection the article appeared in (Education, Small Business, Room for Debate, etc.)
•	Headline = the title of the article
•	Snippet = a small portion of the article text
•	Abstract = a summary of the blog article, written by the New York Times
•	WordCount = the number of words in the article
•	PubDate = the publication date, in the format "Year-Month-Day Hour:Minute:Second"
•	UniqueID = a unique identifier for each article

The popularity of the articles was predicted with the help of logistics Regression Model developed in R. 
While preparing this model , feature extraction  was used to get Date, Hour, Weekday from the independent Variable PubDATE.
Using ‘tm’ package in R, text analytics was performed in preparing the data .
Some of the transformations done were Creating a Corpus, Removing Punctuation, Removing Stop Words, Converting to lower case 
and Stemming. Next Term Document Matrix (TDM) was created which shows the number of times each word in the corpus is found in
each of the documents and sparse terms were removed. After this a data frame was created for the bag of words. The bag of words 
and the independent variables were used in the logistic regression model to predict popularity of articles.

