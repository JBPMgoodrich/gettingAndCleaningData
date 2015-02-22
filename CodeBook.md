
---
title: "Code book for course project for Getting and Cleaning Data"
author: "James Goodrich"
date: "Sunday, February 22, 2015"
output: html_document
---

</br>
Data set background:  Using a smartphone equipped with an accelerometer and gyroscope, the motion characteristics of different activities of daily living were measured.  The aim was to develop a way to capture data characterizing a set of defined activities an individual is performing at a given time.  Study volunteers wore a Samsung Galaxy S II on their waist.

The data set dataTidy2.txt was output from an R script **run_analysis.R** that used as input raw data made available on the intranet by: 
</ul>*Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.*
</br>

 1. subject = Numeric identifier for a given volunteer whose activity was being measured in this data record. Values are integers in the range 1 to 30.
 
 2. activity = Character string identifying the activity for which measurements on this data record were captured.  Values are one of: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, or LAYING.

 3. tbodyaccmeanx = The numeric mean of a particular derived value from across the raw data measured multiple times for a given subject and activity.  This variable and all others beginning with "t" are time domain signals.  Like other variables beginning with "tbody", this variable represents a derived measure of the acceleration of motion of the body of the volunteer subject once acceleration due to gravity was separated out of the signal.  The specific derived measure is the mean of accelearation determined along the x-axis of a defined cartesian coordinate system.  The range of values were normalized and bounded in the range -1 to 1.
 
 4. tbodyaccmeany = Similar to tbodyaccmeanx but the measure was mean of acceleration measured along the y-axis.
 
 5. tbodyaccmeanz = Similar to tbodyaccmeanx but the measure was mean of acceleration measured along the z-axis.
 
 6. tgravityaccmeanx = Like other variables beginning with "tgravity", this variable represents a derived measure of the acceleration of motion, but in this case that attributable to gravity.  The specific derived measure is the mean of accelearation determined along x-axis of a cartesian coordinate system.  The range of values were again normalized and bounded in the range -1 to 1.
 
 7. tgravityaccmeany = Similar to tgravityaccmeanx but the measure was in relation to the y-axis.
 
 8. tgravityaccmeanz = Similar to tgravityaccmeanx but the measure was in relation to the z-axis.
 
 9. tbodyaccjerkmeanx = Obtained from time derivation of linear acceleration of the body of the volunteer subject.  The specific derived measure is the mean of a "jerk signal" determined along the x-axis of a defined cartesian coordinate system.  The range of values were normalized and bounded in the range -1 to 1.
 
10. tbodyaccjerkmeany = Similar to tbodyaccjerkmeanx but the measure was in relation to the y-axis.

11. tbodyaccjerkmeanz = Similar to tbodyaccjerkmeanx but the measure was in relation to the z-axis.

12. tbodygyromeanx = This variable is a derived measure of the mean of angular velocity for the body of the volunteer subject.  The value is that determined in relation to the x-axis of a cartesian coordinate system.  The range of values were again normalized and bounded in the range -1 to 1.

13. tbodygyromeany = Similar to tbodygyromeanx but the measure was in relation to the y-axis.

14. tbodygyromeanz = Similar to tbodygyromeanx but the measure was in relation to the z-axis.

15. tbodygyrojerkmeanx = Obtained from time derivation of angular velocity of the body of the volunteer subject.  The specific derived measure is the mean of a "jerk signal" determined in relation to the x-axis of a defined cartesian coordinate system.  The range of values again were normalized and bounded in the range -1 to 1.

16. tbodygyrojerkmeany = Similar to tbodygyrojerkmeanx but the measure was in relation to the y-axis.

17. tbodygyrojerkmeanz = Similar to tbodygyrojerkmeanx but the measure was in relation to the z-axis.

18. tbodyaccmagmean = This is an additional vector, involving the mean magnitude of acceleration for the body of the subject volunteer, oobtained from averaging signals in a "signal window sample" and is used on the angle() variable.  The range of values again were normalized and bounded in the range -1 to 1.

19. tgravityaccmagmean = Similar to tbodyaccmagmean but involving the mean magnitude of acceleration attributable to gravity.  
NOTE: Statistics on the summary data set output from **run_analysis.R**, but also on the raw input data, show that means on this data column are identical to tbodyaccmagmean, so it looks like error exists in raw inputs.  Just found as I was typing this and nearly freaked that I had a programming bug until I confirmed it is true of input columns 201 and 214 in the "train" data set. 

20. tbodyaccjerkmagmean = Similar to tbodyaccmagmean but involving the mean magnitude of "jerk signals".

21. tbodygyromagmean = Similar to tbodyaccmagmean but involving the mean magnitude of angular velocity.

22. tbodygyrojerkmagmean = Similar to tbodygyromagmean but the analogous "jerk signal" mean magnitude.

23. fbodyaccmeanx = The numeric mean of a particular derived value arising from applying Fast Fourier Transform (FFT) on various signal measures.  This variable and all others beginning with "f" are "frequency domain signals".  Like other variables beginning with "fbody", this variable represents a derived measure of the acceleration of motion of the body of the volunteer subject once acceleration due to gravity was separated out.  The specific derived measure is the mean of accelearation determined along the x-axis of a defined cartesian coordinate system.  The range of values were normalized and bounded in the range -1 to 1.

24. fbodyaccmeany = Similar to fbodyaccmeanx but the measure was in relation to the y-axis.

25. fbodyaccmeanz = Similar to fbodyaccmeanx but the measure was in relation to the z-axis.

26. fbodyaccmeanfreqx = "Weighted average of the frequency components to obtain a mean frequency" (?) in relation to linear acceleration of the body of the subject volunteer along the x-axis.

27. fbodyaccmeanfreqy = Similar to fbodyaccmeanfreqx but the measure was in relation to the y-axis.

28. fbodyaccmeanfreqz = Similar to fbodyaccmeanfreqx but the measure was in relation to the z-axis.

29. fbodyaccjerkmeanx = Fast Fourier Transform (FFT) analogue of tbodyaccjerkmeanx.

30. fbodyaccjerkmeany = FFT analogue of tbodyaccjerkmeany.

31. fbodyaccjerkmeanz = FFT analogue of tbodyaccjerkmeanz.

32. fbodyaccjerkmeanfreqx = "Weighted average of the frequency components to obtain a mean frequency" (?) in relation to the "jerk signal" for linear acceleration of the body of the subject volunteer along the x-axis.

33. fbodyaccjerkmeanfreqy = Similar to fbodyaccjerkmeanfreqx but the measure was in relation to the y-axis.

34. fbodyaccjerkmeanfreqz = Similar to fbodyaccjerkmeanfreqx but the measure was in relation to the z-axis.

35. fbodygyromeanx = FFT analogue of tbodygyromeanx.

36. fbodygyromeany = FFT analogue of tbodygyromeany.

37. fbodygyromeanz = FFT analogue of tbodygyromeanz.

38. fbodygyromeanfreqx = "Weighted average of the frequency components to obtain a mean frequency" (?) in relation to the angular velocity of the body of the subject volunteer along the x-axis.

39. fbodygyromeanfreqy = Similar to fbodygyromeanfreqx but the measure was in relation to the y-axis.

40. fbodygyromeanfreqz = Similar to fbodygyromeanfreqx but the measure was in relation to the z-axis.

41. fbodyaccmagmean = FFT analogue of tbodyaccmagmean

42. fbodyaccmagmeanfreq = "Weighted average of the frequency components to obtain a mean frequency" (?) in relation to fbodyaccmagmean.

43. fbodybodyaccjerkmagmean = This variable's definition is unclear from the information provided, and my ability to interpolate the design of the experiment.

44. fbodybodyaccjerkmagmeanfreq = This variable's definition is unclear from the information provided, and my ability to interpolate the design of the experiment.

45. fbodybodygyromagmean = This variable's definition is unclear from the information provided, and my ability to interpolate the design of the experiment.

46. fbodybodygyromagmeanfreq = This variable's definition is unclear from the information provided, and my ability to interpolate the design of the experiment.

47. fbodybodygyrojerkmagmean = This variable's definition is unclear from the information provided, and my ability to interpolate the design of the experiment.

48. fbodybodygyrojerkmagmeanfreq = This variable's definition is unclear from the information provided, and my ability to interpolate the design of the experiment.

49. angletbodyaccmeangravity = This variable's definition is unclear from the information provided, and my ability to interpolate the design of the experiment.

50. angletbodyaccjerkmeangravitymean = This variable's definition is unclear from the information provided, and my ability to interpolate the design of the experiment.

51. angletbodygyromeangravitymean = This variable's definition is unclear from the information provided, and my ability to interpolate the design of the experiment.

52. angletbodygyrojerkmeangravitymean = This variable's definition is unclear from the information provided, and my ability to interpolate the design of the experiment.

53. anglexgravitymean = This variable's definition is unclear from the information provided, and my ability to interpolate the design of the experiment.

54. angleygravitymean = This variable's definition is unclear from the information provided, and my ability to interpolate the design of the experiment.

55. anglezgravitymean = This variable's definition is unclear from the information provided, and my ability to interpolate the design of the experiment.

56. tbodyaccstdx = Standard deviation analogue of the mean measure tbodyaccmeanx.

57. tbodyaccstdy = Standard deviation analogue of the mean measure tbodyaccmeany.

58. tbodyaccstdz = Standard deviation analogue of the mean measure tbodyaccmeanz.

59. tgravityaccstdx = Standard deviation analogue of the mean measure tgravityaccmeanx.

60. tgravityaccstdy = Standard deviation analogue of the mean measure tgravityaccmeany.

61. tgravityaccstdz = Standard deviation analogue of the mean measure tgravityaccmeanz.

62. tbodyaccjerkstdx = Standard deviation analogue of the mean measure tbodyaccjerkmeanx.

63. tbodyaccjerkstdy = Standard deviation analogue of the mean measure tbodyaccjerkmeany.

64. tbodyaccjerkstdz = Standard deviation analogue of the mean measure tbodyaccjerkmeanz.

65. tbodygyrostdx = Standard deviation analogue of the mean measure tbodygyromeanx.

66. tbodygyrostdy = Standard deviation analogue of the mean measure tbodygyromeany.

67. tbodygyrostdz = Standard deviation analogue of the mean measure tbodygyromeanz.

68. tbodygyrojerkstdx = Standard deviation analogue of the mean measure tbodygyrojerkmeanx.

69. tbodygyrojerkstdy = Standard deviation analogue of the mean measure tbodygyrojerkmeany.

70. tbodygyrojerkstdz = Standard deviation analogue of the mean measure tbodygyrojerkmeanz.

71. tbodyaccmagstd = Standard deviation analogue of the mean measure tbodyaccmagmean.

72. tgravityaccmagstd = Standard deviation analogue of the mean measure tgravityaccmagmean.  See also note on tgravityaccmagmean.

73. tbodyaccjerkmagstd = Standard deviation analogue of the mean measure tbodyaccjerkmagmean.

74. tbodygyromagstd = Standard deviation analogue of the mean measure tbodygyromagmean.

75. tbodygyrojerkmagstd = Standard deviation analogue of the mean measure tbodygyrojerkmagmean.

76. fbodyaccstdx = Standard deviation analogue of the mean measure fbodyaccmeanx.

77. fbodyaccstdy = Standard deviation analogue of the mean measure fbodyaccmeany.

78. fbodyaccstdz = Standard deviation analogue of the mean measure fbodyaccmeanz.

79. fbodyaccjerkstdx = Standard deviation analogue of the mean measure fbodyaccjerkmeanx.

80. fbodyaccjerkstdy = Standard deviation analogue of the mean measure fbodyaccjerkmeany.

81. fbodyaccjerkstdz = Standard deviation analogue of the mean measure fbodyaccjerkmeanz.

82. fbodygyrostdx = Standard deviation analogue of the mean measure fbodygyromeanx.

83. fbodygyrostdy = Standard deviation analogue of the mean measure fbodygyromeany.

84. fbodygyrostdz = Standard deviation analogue of the mean measure fbodygyromeanz.

85. fbodyaccmagstd = Standard deviation analogue of the mean measure fbodyaccmagmean.

86. fbodybodyaccjerkmagstd = Standard deviation analogue of the mean measure fbodybodyaccjerkmagmean.

87. fbodybodygyromagstd = Standard deviation analogue of the mean measure fbodybodygyromagmean.

88. fbodybodygyrojerkmagstd = Standard deviation analogue of the mean measure fbodybodygyrojerkmagmean.
