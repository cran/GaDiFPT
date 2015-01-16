\name{FPTdensity_byint}
\alias{FPTdensity_byint}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Evaluation of the FPT density and distribution functions
}
\description{
The FPT density g0 and distribution function gg0 are evaluated up to a fixed time T on N1max gridpoints by numerical integration of the Volterra integral equation given in Buonocore 1987. Note that this time may not correspond to the final time Tfin when full reconstruction of the FPT density by quadrature is not required (quadflag set to 0 in the input parameters list). 
}
\usage{
FPTdensity_byint(obj,n1max)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{obj}{
  An \dQuote{inputlist} class object yielding all the input parameters
}
  \item{n1max}{
  Total number of gridpoints in the evaluation procedure
}
}
\value{
Values are returned as an object of class \dQuote{FPTdensity} yielding the timegrid and the corresponding values of the FPT density and FPT distribution.
}
\references{
Buonocore, A., Nobile, A.G., and Ricciardi, L.M., A new integral equation for the evaluation of first-passage-time probability densities.
\emph{Adv Appl Prob 19} (1987), 784--800.
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
}

Nmax <- which.min(abs(mp[2:(N+1)]-mp[1:N]))
N1 <- N
if (quadflag == 0)   N1 <- max(c(Nmax,N/4))
N1p1 <- N1+1
answer <- FPTdensity_byint(param,N1)
plot(answer)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ ~kwd1 }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
