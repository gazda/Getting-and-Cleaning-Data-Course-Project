Code Book for Course Project
========================================================

## Transformations

From original data set only features that contained mean or std of the observation were extracted together with activity name/label and subject number that conducted the experiment.
This values were further averaged for each activity name and subject number thus producing the final data set.

## Naming convention

Extracted features were renamed to conform to certain rules.
Their new names have following format:

```
Domain.Measure.Aggregation[.Axis]
```

1. `Domain` determines whether the value are from time or frequency domains.
1. `Measure` determines the signal measured. They are listed bellow.
1. `Aggregation` determines the aggregation performed on original signal, either `mean` or `std`
1. `Axis` determines the direction in 3d space. It is optional and if missing then the signal is the magnitude.

Measures have are a compound carrying several meanings in their name:

* If the first word is `Gravity` then the measure is due to the gravitational force.
* If the first word is `Body` then the measure is due to the body motion.
* If it contains `Acc` then the signal originated from accelerometer.
* If it contains `Gyro` then the signal originated from gyroscope.
* If it contains `Jerk` then the body linear acceleration and angular velocity were derived in time to obtain the signal.
* If it contains `Mag` then the value represents the magnitued of the signal and has no axial components.

This is the list of all possible `Measures`:

* BodyAcc
* BodyAccJerk
* BodyAccJerkMag
* BodyAccMag
* BodyBodyAccJerkMag
* BodyBodyGyroJerkMag
* BodyBodyGyroMag
* BodyGyro
* BodyGyroJerk
* BodyGyroJerkMag
* BodyGyroMag
* GravityAcc
* GravityAccMag

## List of all the columns

* Activity.Name

  Contains the names of activity:
  * WALKING
  * WALKING_UPSTAIRS
  * WALKING_DOWNSTAIRS
  * SITTING
  * STANDING
  * LAYING

* Subject.No

  Contains the number of the subject.
  
All other columns contain the average value of the measures for each `Activity.Name` and `Subject.No`:

* Time.BodyAcc.Mean.X
* Time.BodyAcc.Mean.Y
* Time.BodyAcc.Mean.Z
* Time.BodyAcc.Std.X
* Time.BodyAcc.Std.Y
* Time.BodyAcc.Std.Z
* Time.GravityAcc.Mean.X
* Time.GravityAcc.Mean.Y
* Time.GravityAcc.Mean.Z
* Time.GravityAcc.Std.X
* Time.GravityAcc.Std.Y
* Time.GravityAcc.Std.Z
* Time.BodyAccJerk.Mean.X
* Time.BodyAccJerk.Mean.Y
* Time.BodyAccJerk.Mean.Z
* Time.BodyAccJerk.Std.X
* Time.BodyAccJerk.Std.Y
* Time.BodyAccJerk.Std.Z
* Time.BodyGyro.Mean.X
* Time.BodyGyro.Mean.Y
* Time.BodyGyro.Mean.Z
* Time.BodyGyro.Std.X
* Time.BodyGyro.Std.Y
* Time.BodyGyro.Std.Z
* Time.BodyGyroJerk.Mean.X
* Time.BodyGyroJerk.Mean.Y
* Time.BodyGyroJerk.Mean.Z
* Time.BodyGyroJerk.Std.X
* Time.BodyGyroJerk.Std.Y
* Time.BodyGyroJerk.Std.Z
* Time.BodyAccMag.Mean
* Time.BodyAccMag.Std
* Time.GravityAccMag.Mean
* Time.GravityAccMag.Std
* Time.BodyAccJerkMag.Mean
* Time.BodyAccJerkMag.Std
* Time.BodyGyroMag.Mean
* Time.BodyGyroMag.Std
* Time.BodyGyroJerkMag.Mean
* Time.BodyGyroJerkMag.Std
* Freq.BodyAcc.Mean.X
* Freq.BodyAcc.Mean.Y
* Freq.BodyAcc.Mean.Z
* Freq.BodyAcc.Std.X
* Freq.BodyAcc.Std.Y
* Freq.BodyAcc.Std.Z
* Freq.BodyAccJerk.Mean.X
* Freq.BodyAccJerk.Mean.Y
* Freq.BodyAccJerk.Mean.Z
* Freq.BodyAccJerk.Std.X
* Freq.BodyAccJerk.Std.Y
* Freq.BodyAccJerk.Std.Z
* Freq.BodyGyro.Mean.X
* Freq.BodyGyro.Mean.Y
* Freq.BodyGyro.Mean.Z
* Freq.BodyGyro.Std.X
* Freq.BodyGyro.Std.Y
* Freq.BodyGyro.Std.Z
* Freq.BodyAccMag.Mean
* Freq.BodyAccMag.Std
* Freq.BodyBodyAccJerkMag.Mean
* Freq.BodyBodyAccJerkMag.Std
* Freq.BodyBodyGyroMag.Mean
* Freq.BodyBodyGyroMag.Std
* Freq.BodyBodyGyroJerkMag.Mean
* Freq.BodyBodyGyroJerkMag.Std
