# Getting_and_cleaning_data_Week4_assignment
The project includes following files: README.MD, codebook.rmd, run_analysis.R and tidy_data.txt

Here what the script does:
1. Load the dataset: X_train.txt, X_test.txt, Y_train.txt, Y_test.txt, subject_train.txt, subject_test.txt, features.txt, activity_labels.txt.
2. Merge X_train and X_test in X, merge Y_train and Y_test in Y and merge subject_train and subject_test in sub_all
3. Extract mean and standard deviation from each measurement.
4. Uses descriptive activity names to name the activities in the data set.
5. Appropriately labels the data set with descriptive variable names.
6. Create tidy dataset (tidy_data.txt) with the average of each variable for each activity and each subject.
