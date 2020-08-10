#' @title The package estimates the most essential summary/descriptive statistics
#' @description The package estimates two groups of summary/descriptive statistics for each variable (column) of the data: the most essential quantiles that are ordered from minimum to maximum; and the four major summary characteristics of a distribution, often called the first four moments of the distribution. Additionally it also reports the number of non-missing observations for each variable.
#' @param A tibble or conventional data frame containing only continuous or quasi-continuous quantitative variables of type double or integer
#' @return A tibble (table) containing the estimated essential summary statistics for each variable
#' @example rmsumst(A)
#' @export

#a custom function for computing summary statistics
rmsumst = function(B){
  for (i in 1:base::ncol(B)){
    VAR = base::names(B)[i]
    X = base::data.frame(B[,i])
    X = stats::na.omit(X)[,1]
    N = base::sum(!is.na(X))
    #reports the number of observations which are missing
    #exclamation mark means not
    #here we are counting the number of non- missing values
    MIN = min(X)
    P5 = stats::quantile( X, probs=0.05 )[[1]]
    #5 percent percentile, this is a conservative boundary of the left tail
    P25 = stats::quantile( X, probs=0.25 )[[1]]
    MED = base::median(X)
    #50 percent of the data, it splits the data 50/50 and is one of the most important quantiles of the distribution
    P75 = stats::quantile( X, probs=0.75 )[[1]]
    #note that the interquartile range is IQR=P75-P25
    P95 = stats::quantile( X, probs=0.95 )[[1]]
    MAX = base::max(X)
    MEAN = base::mean(X)
    #note that mean is not a robust measure of central tendency but median is
    SD = stats::sd(X)
    #sd is not robust because it is estimated using all the observations, similarly to the mean
    SKEW = e1071::skewness(X)
    #a measure of symmetry. Positive skewness means that there are more outliers to the right
    EXKURT = e1071::kurtosis(X)
    #excess kutosis is a measure of how heavy the tails are, it is equal to kurtosis-3
    #EXKURT<0: the tails are shorter/lighter; EXKURT>0: the tails are longer/heavier than for a normal distribution

    ST = dplyr::tibble(VAR, N, MIN, P5, P25, MED, P75, P95, MAX, MEAN, SD, SKEW, EXKURT)
    #one row containing summary statistics for one variable
    if (i==1) SUMST=ST else SUMST=dplyr::bind_rows(SUMST,ST)
  }
  return(SUMST)
}



