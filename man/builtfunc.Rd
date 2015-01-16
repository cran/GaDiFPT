\name{builtfunc}
\alias{builtfunc}
\alias{a}
\alias{b}
\alias{cc}
\alias{S}
\alias{Sp}
\alias{a1}
\alias{a2}
\alias{mdt}
\alias{vdt}
\alias{fdt}
\alias{psi}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Functions characterizing the Gaussian Diffusion process X(t) and the considered threshold
}
\description{
\code{builtfunc} evaluates all the functions describing a generic Gaussian  Diffusion process X(t) (drift, infinitesimal variance, mean, variance and first derivative of the transition density); it also evaluates the threshold function and its time derivative, both required in the evaluation of the kernel function of the Volterra integral equation for the FPT pdf (Buonocore 1987).
}
\usage{
a(t)
b(t)
cc(t)
S(t)
Sp(t)
a1(x, t) 
a2(t) 
mdt(t,y,tau)
vdt(t,tau) 
fdt(x,t,y,tau) 
psi (t, y, tau)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x }{
current value of the process X(t)
}
  \item{t }{
current time
}
\item{y }{
previous value of the process X at time tau
}
\item{tau }{
previous time
}
}
\value{
\item{a1 }{gives the drift of the process as a(t)*x + b(t)}
\item{a2 }{gives the infinitesimal variance of the process as cc(t)}
\item{S }{gives the threshold}
\item{Sp }{gives the threshold time derivative}
\item{mdt }{gives the mean of the transition pdf of the process}
\item{vdt }{gives the variance of the transition pdf of the process}
\item{fdt }{gives the transition pdf of the process}
\item{psi }{gives the kernel for evaluating the FPT pdf of the process via numerical integration of the Volterra integral equation}
}
\author{
A. Buonocore, M.F. Carfora
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.


delta <- 0.5
time.vec <- seq(0, by=delta, 100)

# linear threshold
Scost <- 6
Sslope <- 0.2
# user provided function (see examples in demo folder)
SSS <- function(t) {
  SSS <- Scost + Sslope*t
}
Slin <- S(time.vec)
plot(time.vec,Slin,type='l',xlab='time',ylab='threshold',main='linear threshold')

# periodic threshold
S0 <- 0
S1 <- 2
Sfr <- 0.5 
# user provided function (see examples in demo folder)
SSS <- function(t) {
  SSS <- S1*cos(Sfr*t+S0)
}
Sper <- S(time.vec)
plot(time.vec,Sper,type='l',xlab='time',ylab='threshold',main='periodic threshold')
}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ ~kwd1 }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
