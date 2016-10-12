**Overview** The data is collected from the accelerometers from the Samsung Galaxy S smartphone
on 30 test subjects performing one of six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).
A full description is available at the site where the data was obtained
[here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
; for convenience, a portion of this description is repeated below:

"The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain."

The origional data set was downloaded from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

This dataset was processed to form two datasets: MotionData.csv and MotionDataAveraged.csv

**motionData Column Descriptions**

1. *activity* one of six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)

2. *subject* number which identifies which of 30 subjects performed the activity

3-81. Feature vectors as described above. The origional dataset contained 561 features.
This dataset retained only those elements of the feature vector which represented 
a mean or standard deviation (79 total retained) of observations during a single 2.56sec window (128 observations). The units are standard gravity units for the acceleration data and radians per second for the gyro data.

**motionDataAveraged Column Descriptions**

1. *activity* one of six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)

2. *subject* number which identifies which of 30 subjects performed the activity

3-81. Feature vectors as described above, except averaged for each subject and activity across all observation windows

