## A note the the reviewers of this assignement

* I noticed a small bug in the R script after I uploaded it to github (after the deadline):
In Line 44 when loading the feature labels with read.table, I forgot to remove the path to the file "features.txt". 
* it shoud read: features_labels <-read.table("features.txt",colClasses=c("character"))
* also the last pipe operator in line 73 is obsolete, but the script should run fine with it in.
