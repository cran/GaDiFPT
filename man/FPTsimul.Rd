\name{FPTsimul}
\alias{FPTsimul}
\alias{histplot}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Simulation of FPT by the Hazard Rate Method
}
\description{
\code{FPTsimul} generates M spikes (times of first boundary crossing) for the Gaussian Diffusion proces X(t) by implementing the Hazard Rate Method, based on the instantaneous firing rate, defined as the ratio between the probability density function and the survival function of the process.
The asymptotic firing rate is also estimated to shorten computations.
\code{histplot} then produced an histogram of the simulated times and plot it against the approximated FPT density as obtained by \code{FPTdensity_byint}
}
\usage{
FPTsimul(obj,M)
histplot(obj1,obj)
}
\arguments{
  \item{obj}{
  An \dQuote{FPTdensity} class object yielding the numerical approximation of the FPT  density and the FPT distribution on a given timegrid
 }
  \item{M}{
  The number of crossing times to be simulated
 }
 \item{obj1}{
 A vector of simulated crossing times as obtained by a call to \code{FPTsimul}.
 }
}
\value{
\code{FPTsimul} returns a vector containing the simulated crossing times;
\code{histplot} produces an histogram plot of these crossing times with the approximated FPT density superimposed
}
\references{
A. Buonocore, L. Caputo, E. Pirozzi, M.F. Carfora, A Simple Algorithm to Generate Firing Times for Leaky Integrate-and-Fire Neuronal Model,
   \emph{Math Biosci Eng},11, 1-10 (2014).
}
\author{
A. Buonocore, M.F. Carfora
}

%% ~Make other sections like Warning with \section{Warning }{....} ~
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## Continuing the Wiener() example:
\dontshow{
library(GaDiFPT)
Wiener <- diffusion(c("mu","sigma2"))

# user-provided parameters and functions
mu <- 0.0
sigma2 <- 1.0
Scost <- 8
Sslope <- 0
Stype <- "constant"

t0 <- 0.0
x0 <- 0.0
Tfin <- 4000    
deltat <- 1.0
N <- floor((Tfin - t0)/deltat)  
M <- 1000
quadflag <- 1
RStudioflag <- TRUE

param <- inputlist(mu,sigma2,Stype,t0,x0,Tfin,deltat,M,quadflag,RStudioflag)

aaa <- function(t) {
  aaa <- 0.0 + 0.0*t
}

bbb <- function(t) {
  bbb <- mu + 0.0*t
}

SSS <- function(t) {
  SSS <- Scost + Sslope*t
}

SSSp <- function(t) {
  SSSp <- Sslope
}

####       INITIALIZATION OF VECTORS

tempi <- numeric(N+1)
mp <- numeric(N+1)
up <- numeric(N+1)
vp <- numeric(N+1)

# dummy vector
app <- numeric(N)

####    EVALUATION OF MEAN AND COVARIANCE OF THE PROCESS

tempi <- seq(t0, by=deltat, length=N+1)

dum <- vectorsetup(param)
mp <- dum[,1]
up <- dum[,2]
vp <- dum[,3]

Nmax <- which.min(abs(mp[2:(N+1)]-mp[1:N]))
N1 <- N
if (quadflag == 0)   N1 <- max(c(Nmax,N/4))
N1p1 <- N1+1
answer <- FPTdensity_byint(param,N1)
plot(answer)
}

spikes <- FPTsimul(answer,M)
histplot(spikes,answer)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ ~kwd1 }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
