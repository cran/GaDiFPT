\name{diffusion}
\alias{diffusion}
\alias{is.diffusion}
\alias{print.diffusion}

%- Also NEED an '\alias' for EACH other topic documented here.
\title{Diffusion processes}

\description{
\code{diffusion} creates an object of class \dQuote{diffusion} from the set of provided values.
\code{is.diffusion}checks if its argument is an object of class \dQuote{diffusion}.
\code{print} shows an object of class \dQuote{diffusion}.
}

\usage{
diffusion(text)
is.diffusion(obj)
\method{print}{diffusion}(x, \dots)
}

\arguments{ 
 \item{text }{a character vector of length two, containing the infinitesimal mean and infinitesimal variance of the process}
  \item{obj}{an \R object to be tested}
  \item{x}{an object of class \dQuote{diffusion}}
  \item{\dots}{additional arguments potentially passed (currently none is considered).}
}

\value{
\code{diffusion} returns an object of class \dQuote{diffusion} that defines a family of diffusion processes.
It is a two-component list:
  \item{mean}{character of length 1 with the mathematical expression of the infinitesimal mean of the process;}
  \item{var}{character of length 1 with the mathematical expression of the infinitesimal variance of the process.}
\code{is.diffusion} returns \code{TRUE} or \code{FALSE} depending on whether its argument is an object of class \dQuote{diffusion} or not.
\code{print.diffusion} shows a brief description of the process reporting the functional form of its infinitesimal mean and variance.
}

\author{
A. Buonocore, M.F. Carfora
}

\examples{
## Creating a "diffusion" object representing a Wiener process 
Wiener <- diffusion(c("mu","sigma2"))

## Creating a "diffusion" object representing 
## an Ornstein-Uhlenbeck process with an injected current

OrnUhlCur <- diffusion(c("-x/theta + mu + i0*exp(-(t-t0)/theta1)","sigma2"))

## testing diffusion objects

is.diffusion(Wiener)
is.diffusion(OrnUhlCur)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ ~kwd1 }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
