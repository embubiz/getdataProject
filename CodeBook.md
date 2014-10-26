Code Book of the getdataProject
==============

The aim of the project is to select a certain set of variables (features) and to provide for each of the 30 test subject (id)
and each of the activity (LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS) an average value.

The features selected for this database have descriptive names esxplained in the comments of the script and for each of them
both mean and standard deviation are provided in the output tidy dataset.

The names of the features are built in a standardized way, pasting together fixed.size string, each of them describing an
aspect of the feature itself and ending with a point

1. time. or freq.
   describing whether the feature is a time or frequency domain signal
2. body. or grav.
   describing whether the feature relates to the body or the gravity acceleration
3. acc. or gyr.
   describing whether the feature is an acceleration or an angular velocity, i.e. if it's measured using the accelerometer or      the gyroscope of the smartphone
4. jerk. or nonj.
   describing whether the feature is a time derived (jerk) or not (nonj) quantity
5. X/Y/Zax. or Mag.
   describing whether the feature is an X/Y/Z component of the measured quantity or if it's the magnitude of it
6. mean. or stdd.
   describing whether the mean or the standard deviation of the measurements is computed
