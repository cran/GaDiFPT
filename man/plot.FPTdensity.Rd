\name{plot.FPTdensity}
\alias{plot.FPTdensity}
\title{Plotting Method for FPTdensity objects}
\description{
  This function creates the plots of the approximate density function and the approximate distribution function for the FPT problem at hand. It also creates an additional plot for the corresponding hazard rate function, representing the instantaneous rate of the crossing occurrence at a certain time, conditional on its not occurring before that time.
}
\usage{
  \method{plot}{FPTdensity}(x, \dots)
}
\arguments{
  \item{x}{an object of class \dQuote{FPTdensity}, a result of a call to \code{\link{FPTdensity_byint}} function}
  \item{\dots}{additional arguments potentially passed (currently none is considered).}
}
\author{
A. Buonocore, M.F. Carfora
}
