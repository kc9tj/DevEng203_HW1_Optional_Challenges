# -*- coding: UTF-8 -*-
#' Sample_size Calculation
#' 
#' Calculate the necessary sample size.
#' @param sd standard deviation
#' @param MDE The minimum detectable effect size. 
#' @param alpha Significance. The probability of a type I error. 
#' @param power (1-k) likelihood of detecting an actual effect. 
#' @return The calculated sample size.
#' @examples
#' # Example 1: Calculate sample size with specific parameters
#' size1 <- sample_size(sd = 10, MDE = 5, alpha = 0.05, power = 0.8)
#' Example 2: Calculate sample size with different parameters
#' size2 <- sample_size(sd = 15, MDE = 8, alpha = 0.01, power = 0.9)

#' @export
sample_size <- function(sd, MDE, alpha, power){
  z_alpha <- qnorm(1-alpha/2)
  z_power <- qnorm(power)
  size = 2 * sd^2 * (z_alpha + z_power)^2 / MDE^2
  return(ceiling(size))
}