#' Obtain fixed and random effects from INLA regression model
#' Get criteria DIC,WAIC,RMSE and R2 for comparing model performance
#' @name BZIP
#' @title Bayesian Analysis of zero-inflated poisson models using Integrated Nested Laplace Approximation
#' @description This package bases on package R-INLA, using Bayesian method to analysis zero-inflated problems.
#' @details You can use this package to analysis zero-inflated data,inputting formula(y and predictors x).Warning: You must install package r-inla before using this package.
#' @param formula String defining the likelihood familiy.
#' @param  data A dataframe including covariates and response data.
#' @param observed The actual observed data.
#' @return A list with the result and choice.
#' @export
#' @import
#' @importFrom
#' @examples
BZIP <- function(formula = NULL,data = NULL,observed = NULL){
  if (missing(formula)) {
    stop("Usage: BZIP(formula, family, data, ...)")
  }
  if (missing(data)){
    stop("Missing data.frame/list `data")
  }
  library(INLA)
  #if (debug) {
    #print('Warning:please install package INLA firstly')
  #}
  model <- inla(formula = formula,family = 'zeroinflatedpoisson1',data = data,
                control.predictor=list(compute=TRUE,link=1),
                control.compute=list(dic=TRUE,waic=TRUE,cpo=TRUE))
  rmse <- sqrt(mean((observed-model$summary.fitted.values$mean[1:nrow(data)])^2,na.rm = TRUE))
  R2 <- sum((model$summary.fitted.values$mean[1:nrow(data)]-mean(observed))^2)/sum((observed-mean(observed))^2)
  choice <- NULL
  choice <- data.frame(WAIC = model$waic$waic,
                       DIC = model$dic$dic,
                       rmse,
                       R2)
  output <- list(result = summary(model),
                 choice = choice)
  #summary(model)
}






