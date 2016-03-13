---
title: "Assignment2"
author: "Charalambos Ioannides"
date: "13 March 2016"
---

##Data
Data come from local files inside ./DATA/ directory (rename extracted folder of .zip file to DATA/ )

## Variables
trainX_raw - train dataset of features
trainY_raw - train dataset of target

testX_raw - test dataset of features
testY_raw - test dataset of target

features - the names of the features (variables)
activity_labels - the labels of target variable (y column)

For Step 1.
train_dataset - contains training dataset with corresponding labels
test_dataset - contains test dataset with corresponding labels
all_data - is the combined dataset of train and test datasets

For Step 4.
dtset_labels - contains all the necessary feature names

For Step 2.
mean_data - contains the means of relevant features
std_data - contains the std of relevant features
extr_data - contains all necessary features including Subject ID and Activity (i.e target variable)

For Step 5.
extr_melt - contains an intermediate dataset which will be reshaped by function dcast() into the tidy dataset we are after

tidy_data - the final tidy dataset

## Transformations

For Step 4.
I have renamed the column names with the required names

For Step 3.
I have transformed the Activity variable from numeric to factor using sapply and a custom made function
