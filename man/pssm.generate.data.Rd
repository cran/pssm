\name{pssm.generate.data}
\alias{pssm.generate.data}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Generates data with a piecewise exponential proportional hazards model for progression and surivival
%%  ~~function to do ... ~~
}
\description{Generates data for the pssm model
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
pssm.generate.data(theta1 = 0.2, theta2 = 0.2, 
phaz.progression = log(-log(0.3)/4) * rep(1, 5), 
phaz.survival = log(-log(0.15)/4) * rep(1, 15), accrual = 3, 
followup = 2, m = 5, n = 400, times = NULL, delta = 0.15,alloc=c(1,1),seed=NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{theta1}{Coefficient for treatment covariate for time to progression
%%     ~~Describe \code{theta1} here~~
}
  \item{theta2}{Coefficient for treatment covariate for survival after progression
%%     ~~Describe \code{theta2} here~~
}
  \item{phaz.progression}{log-hazard vector for progression
%%     ~~Describe \code{phaz.progression} here~~
}
  \item{phaz.survival}{log-hazard vector for survival
%%     ~~Describe \code{phaz.survival} here~~
}
  \item{accrual}{accrual time
%%     ~~Describe \code{accrual} here~~
}
  \item{followup}{follow up time
%%     ~~Describe \code{followup} here~~
}
  \item{m}{number of intervals, maximum of times
%%     ~~Describe \code{m} here~~
}
  \item{n}{number of samples
%%     ~~Describe \code{n} here~~
}
  \item{times}{vector of planned times that progression is assessed, if NULL delta isn't used
  and times are between (2*i-1)*m/8, (2*(i+1)-1)*m/8  for i=1,\dots,m-2
%%     ~~Describe \code{times} here~~
}
  \item{delta}{variation around the assessment times
%%     ~~Describe \code{delta} here~~
}
  \item{alloc}{Allocation between control and treatment group \code{c(1,1)} is one to one allocation.
}
  \item{seed}{Seed for the random number generator if you don't want the data that is analyzed to change.}
}

\value{Data frame 
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
tprog0,tprog1,cdeath,tdeath,rx=c(rep(0,n/2),rep(1,n/2)
\item{\code{tprog0}}{Last time the patient was free of progressive disease}
\item{\code{tprog1}}{First time progressive disease was noted, NA if no progression}
\item{\code{cdeath}}{1 if the patient died, 0 otherwise}
\item{\code{tdeath}}{Time of death or last follow up}
\item{\code{rx}}{Treatment indicator a covariate which is 0 or 1}
}
%%\references{
%% ~put references to the literature/web site here ~}
\author{David Schoenfeld
%%  ~~who you are~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\keyword{package}
\seealso{
\code{\link{pssm-class}},
\code{\link{pssm-package}},
\code{\link{pssm.object}}
\code{\link{pssm}},
\code{\link{pssm.simulate}},
\code{\link{pssm.survivalcurv}}
\code{\link{plot-methods}}
\code{\link{pssm.power}}
}

\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.
u=pssm.generate.data(theta1=.5,theta2=0,phaz.progression=rep(log(-log(.3)/4),5),	
phaz.survival=rep(log(-log(.2)/4),15),accrual=2,followup=2.9,m=5,n=300,times=c(.8,2.1,3.4))
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ survival }
\keyword{ interval censoring }% __ONLY ONE__ keyword per line
\keyword{ progression free survival}
