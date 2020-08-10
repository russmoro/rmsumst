# rmsumst

Summary/descriptive statistics for R

Package: rmsumst
Type: Package
Title: The package estimates the most essential summary/descriptive statistics
Version: 0.1.0
Author: Dr Russ Moro
Maintainer: The package maintainer <Russ.Moro@brunel.ac.uk>

Description: The package estimates two groups of summary/descriptive statistics for each
variable (column) of the data, so it performs univariate descriptive analysis.
      (1) The most essential quantiles that are ordered from minimum to maximum:
            (a) MIN -- minimum, the lowest observation in the sample.
            (b) P5 -- the 5% percentile, a.k.a. 0.05 quantile. It is a conservative
            estimate of the left tail boundary.
            (c) P25 -- the 25% percentile, a.k.a. the first quartile Q1.
            (d) MED -- median, the central observation of the sample (or the average
            of the two central observations if the number of observations is even).
            It is a.k.a. the second quartile Q2. Half of the observations in the
            sample are below and half above the median.
            (e) P75 -- the 75% percentile, a.k.a. the third quartile Q3. The distance
            between P75 and P25 is called the interquartile range (IQR), i.e. 
            IQR=P75-P25. 50% of the core observations in the middle of the sample
            lie within the IQR.
            (f) P95 -- the 95% percentile. It is a conservative estimate of the
            right tail boundary. 90% of the core observation in the middle of the
            sample lie between P5 and P95. P5, P25, MED, P75 and P95 are the robust
            measures of location, in the sense that they are not sensitive to
            outliers.
            (g) MAX -- maximum, to highest observation in the sample. The distance
            between MAX and MIN is known the range, i.e. Range=MAX-MIN. MIN and MAX
            are by definition extreme observations and are likely to be outliers,
            i.e. atypical observations.
        (2) The four major summary characteristics of a distribution, often called the
        first four moments of the distribution.
            (a) MEAN -- mean or average (the first moment of the distribution). In
            contrast to the median it is not a robust measure of location as it takes
            all the observations including potential outliers to compute the mean.
            (b) SD -- standard deviation, which is a measure of dispersion. In contrast
            to the IQR it is not a robust measure of dispersion for the same reason
            as MEAN.
            (c) SKEW -- skewness, the third moment of the distribution. It is a measure
            of non-symmetricity. For any symmetric distribution skewness is zero
            (the inverse is generally not true). Negative skewness indicates that the
            left tail is longer/heavier. Positive skewness indicates that the right
            tail is longer/heavier.
            (d) EXKURT -- excess kurtosis, which is a measure of heavy-tailedness,
            it is the difference between kurtosis and 3, e.g. EXKURT = KURT-3, where
            3 is the kurtosis of any normal distribution. If EXKURT<0, then the
            distribution has the tails lighter/shorten than a normal distribution
            and it is called platykurtic. If EXKURT>0, then the distribution has
            heavier/longer tails than a normal distribution and it is called
            leptokurtic. EXKURT is an important measure of outliers and its high
            values indicate the presence of outliers. SKEW and EXKURT characterise
            the tails of the distribution.
Additionally the package also reports the number of non-missing observations for
each variable.

License: GPLv3
Encoding: UTF-8
LazyData: FALSE
Imports: stats, e1071, dplyr

