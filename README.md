
Download the dataset from https://archive.ics.uci.edu/ml/datasets/Bank+Marketing

## Some statistics:

Number of Instances: 45211
Number of Attributes: 16 + output attribute
Attribute information:


   ***Input variables:***
   
   1 - age (numeric)
   2 - job : type of job (categorical: "admin.","unknown","unemployed","management","housemaid","entrepreneur","student",
                                       "blue-collar","self-employed","retired","technician","services") 
   3 - marital : marital status (categorical: "married","divorced","single"; note: "divorced" means divorced or widowed)
   4 - education (categorical: "unknown","secondary","primary","tertiary")
   5 - default: has credit in default? (binary: "yes","no")
   6 - balance: average yearly balance, in euros (numeric) 
   7 - housing: has housing loan? (binary: "yes","no")
   8 - loan: has personal loan? (binary: "yes","no")
   9 - contact: contact communication type (categorical: "unknown","telephone","cellular") 
  10 - day: last contact day of the month (numeric)
  11 - month: last contact month of year (categorical: "jan", "feb", "mar", ..., "nov", "dec")
  12 - duration: last contact duration, in seconds (numeric)
  13 - campaign: number of contacts performed during this campaign and for this client (numeric, includes last contact)
  14 - pdays: number of days that passed by after the client was last contacted from a previous campaign (numeric, -1 means client was not previously contacted)
  15 - previous: number of contacts performed before this campaign and for this client (numeric)
  16 - poutcome: outcome of the previous marketing campaign (categorical: "unknown","other","failure","success")

  **Output variable (desired target):**
  17 - y - has the client subscribed a term deposit? (binary: "yes","no")

Missing Attribute Values: None

## Decribe it and the/an application it is used for
The data is related with direct marketing campaigns of a Portuguese banking institution. 
   The marketing campaigns were based on phone calls. Often, more than one contact to the same client was required in order to access if the product (bank term deposit) would be (or not) subscribed. 

   There are two datasets: 

1. bank-full.csv with all examples, ordered by date (from May 2008 to November 2010).
2. bank.csv with 10% of the examples (4521), randomly selected from bank-full.csv.
   The smallest dataset is provided to test more computationally demanding machine learning algorithms (e.g. SVM).

   The classification goal is to predict if the client will subscribe a term deposit (variable y).

## Tools being used
We're going to use MATLAB with its existing suite of ML tools.
## Linear Classifier with 10-fold cross validation
Load bank-full.csv in via the import utility. This will give us the bankfull table in the workspace.
Create a Naive Bayes model

    mdl=fitcnb(bankfull,'y')
Create cross validation model

    CVMdl=crossval(mdl)
    
Compute cross validation loss

    kfoldLoss(CVMdl)

