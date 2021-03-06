\name{vectorsetup}
\alias{vectorsetup}
\alias{mp}
\alias{up}
\alias{vp}
\title{
Setup of the mean and covariance vectors for the Gaussian Diffusion process
}
\description{
\code{vectorsetup} evaluates the vectors mp (mean of the process) and the two covariance factors up and vp (i.e. covariance of the process is given by up*vp) in the interval [t0, Tfin] with timestep deltat
}
\usage{
vectorsetup(obj)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{obj}{
An \dQuote{inputlist} class object yielding all the input parameters
}
}
\value{
Values are returned as a matrix (mp,up,vp)
}
\author{
A. Buonocore, M.F. Carfora
}

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
Scost <- 10
Sslope <- 0
Stype <- "constant"

t0 <- 0.0
x0 <- 0.0
Tfin <- 4000    
deltat <- 0.5
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

## plot of S and m

splot <- S(tempi)
mp1 <- mp - sqrt(2*sigma2)
mp2 <- mp + sqrt(2*sigma2)
matplot(tempi, cbind(mp,mp1,mp2,splot),type="l",lty=c(1,2,2,1),lwd=1,
        main="mean of the process vs. threshold",xlab="time(ms)",ylab="")
legend("bottomright",c("mean","threshold"),
       lty=c(1,1),col=c("black","blue"))
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ ~kwd1 }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
