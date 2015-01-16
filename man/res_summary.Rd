\name{res_summary}
\alias{res_summary}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{User provided parameters}

\description{
\code{res_summary} writes 
}

\usage{
res_summary(obj,Nspikes,fileout) 
}
\arguments{ 
 \item{obj }{ an object of class \dQuote{FPTdensity}, a result of a call to \code{\link{FPTdensity_byint}} function yielding the approximated values of the FPT density and distribution}
 \item{Nspikes }{the total number of simulated crossing times}
 \item{fileout }{a character indicating the name of the file where the results have to be written.}
}
\value{
\code{res_summary} writes on file a table with the timesteps and the corresponding values of the FPT density and distribution; it also writes the sequence of the generated crossing times.  It also evaluates statistics of the crossing time (mean, standard deviation and median) and send the report to the command window.
}
\author{
A. Buonocore, M.F. Carfora
}
\examples{
## examples are shown as part of the 'examples.Rd' ones
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ ~kwd1 }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
