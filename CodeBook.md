1. Loading data:

'labels' contains data from "activity_labels.txt"
'features' contains data from 'features.txt'

Then I splited data into 'test' and 'train' variables according to the data sets provided: 

subject_train 
subject_test 
X_train 
y_train  
X_test   
y_test 

2. Merging data:

Then I created 'x', 'y' and 'subject' data frames by merging 'test' and 'train' data sets and saved new data sets into variables:

X_df 
y_df 
subject_df

3. After I extracted only the mean and standard deviation values for each measurement, subset required columns and corrected names of the columns. 

'Features_Mean_STD'


4.
Appropriately labeled the data set with descriptive variable names:
'subject' and 'exercise'

and  binded all the data in a single data set:
'xySub'

5. 
Finally I created tidy data set with averages and wrote it on the disk into a file:

'averages_dset.txt'

