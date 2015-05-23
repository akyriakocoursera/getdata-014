---
title: "CodeBook.md"
output: html_document
---

This file describe the data and analysis performed in the run_analysis.R script.

The project data can be found at :

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

- all datasets come in couples _train and _test for each set. We merge them for all datasets x, y and subjects.
- activity_labels contain the literal labels for each activity measured. We translate our activities in x,y with the respective labels and merge x,y, and subject subsets.
- we export the tidy dataset to averages_data.txt
