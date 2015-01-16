\name{inputlist}
\alias{inputlist}
\alias{print.inputlist}
\alias{t0}
\alias{x0}
\alias{Tfin}
\alias{deltat}
\alias{M}
\alias{quadflag}
\alias{RStudioflag}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{User provided parameters}

\description{
\code{inputlist} creates an object of class \dQuote{inputlist} from the given set of provided values.
\code{print} shows an object of class \dQuote{inputlist}.
}

\usage{
inputlist(m,s,Sty,tini,xini,Tend,delta,Ntime,quadfl,RSfl)
\method{print}{inputlist}(x, \dots)
}
\arguments{ 
 \item{m }{gives the constant part of the infinitesimal drift of the process}
 \item{s }{gives the infinitesimal variance of the process}
 \item{Sty }{gives the functional type of the considered threshold}
 \item{tini }{gives the initial time in milliseconds}
 \item{xini }{gives the value of the resting potential of the process}
 \item{Tend }{gives the final time in milliseconds}
 \item{delta }{gives the timestep in milliseconds}
 \item{Ntime }{gives the total number of crossing times to be simulated}
 \item{quadfl }{is a flag denoting the requirement for full reconstruction of the FPT density by numerical integration of the Volterra equation}
 \item{RSfl }{is a technical flag to manage opening and closing of plot windows in case RStudio interface is used}
   \item{x }{an object of class \dQuote{inputlist}}
   \item{\dots}{additional arguments potentially passed (currently none is considered).}
}

\value{
\code{inputlist} returns an object of class \dQuote{inputlist} yielding the user-provided parameters as a named list.
\code{print.inputlist} shows a brief summary of the user provided parameters.
}


\author{
A. Buonocore, M.F. Carfora
}

\examples{
## Creating a list of parameters for the Wiener process

mu <- 0.0
sigma2 <- 1.0
Stype <- "constant"
t0 <- 0.0
x0 <- 0.0
Tfin <- 4000    
deltat <- 1.0
M <- 1000
quadflag <- 1
RStudioflag <- TRUE

# building an object of \dQuote(inputlist) class and printing a summary of its parameters

param <- inputlist(mu,sigma2,Stype,t0,x0,Tfin,deltat,M,quadflag,RStudioflag)

print(param)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ ~kwd1 }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
