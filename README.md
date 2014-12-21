---
title: "README"
output: html_document
---
===================================================
Getting and Cleaning Data
Course Project
Dec 21, 2014

ReadMe (README.md)
===================================================
Using Human Activity Recognition Using Smartphones Dataset Version 1.0 
test (.txt) files to create a tidy data set

This repo explains how all of the scripts work and how they are connected.

The program uses one R script (run_analysis.R).

packages used are "downloader" and "reshape2"

The data is unzipped from 
http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
The datafolder "UCI HAR dataset" is opened in the working directory. 
Folders within the dataset are opened in their directories.

A code book (CodeBook.md) describes the variables, the data, and any transformations or work performed to clean up the data. 