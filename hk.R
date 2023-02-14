#' @title InflurnzaA H1N1 and its influencing factors in HongKong from 2013 to 2014.
#' @docType data of InfluenzaA H1N1 in HongKong from 2013 to 2014.
#' @name hk
#' @formata a dataframe including 730 rows and five variables.The variables are
#' \describle{
#'   \item{Dmp.H1}{antigenic variation of influenzaA H1N1}
#'   \item{DewPointTemp_Mean}{represents the mean of dew point temperature}
#'   \item{Rhumidity_Mean}{represents the mean of relative humidity}
#'   \item{TotalRainfall}{represents total rainfall}
#'   \item{Temp_Mean}{represents the mean of temperature}
#' }
#' @source \code{DewPointTemp_Mean},\code{Rhumidity_Mean},\code{TotalRainfall},\code{Temp_Mean}
#' were obtained from Hong Kong Observatory,\code{Dmp.H1} was calculated by influenza A vaccine and circulating strains
#'
#'
NULL
data <- read.csv('C:/Users/chenz/Desktop/ZZ.csv')
hk <- data.frame(data)

