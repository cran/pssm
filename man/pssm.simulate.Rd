\name{pssm.simulate}
\alias{pssm.simulate}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Simulates pssm analysis
%%  ~~function to do ... ~~
}
\description{Simulates survival and progression model
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
pssm.simulate(nruns, theta1 = 0.2, theta2 = 0.2, 
phaz.progression = log(-log(0.3)/4) * rep(1, 5), 
phaz.survival = log(-log(0.15)/4) * rep(1, 15), accrual = 3, followup = 2, 
m = 5, n = 500, rescale = 1,etime=4.5,seed=NULL)
}
%- maybe also 'usage' for other objects documented here.

\arguments{  
\item{nruns}{number of simulations}

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
 \item{rescale}{Factor to multiply times by} 
 \item{etime}{The time that survival is evaluated}
\item{seed}{Seed for the random number generator if you don't want the data that is analyzed to change.}
}

\value{ A three entry list
%%  ~Describe the value returned
%%  If it is a LIST, use

  \item{objects }{A \code{nruns} by 5 list of 
  "pssm" objects which result from five estimates:
  1-Both survival and progression,
  2-progression only,
  3-tumor free progression,
  4-survival on treatment 0,
  5-survival on treatment 1.
    
Note that the tumor-free progression rates are estimated assuming that progression occurs at the first time it is detected.   
    
    }
  \item{ests }{estimates for treatment effects followed by death rate and progression rate }
  \item{se.ests}{standard errors for the treatment effects}
%% ...
}
%%\references{
%% ~put references to the literature/web site here ~}
\author{David A. Schoenfeld
%%  ~~who you are~~
}


%% ~Make other sections like Warning with \section{Warning }{....} ~

\keyword{ package }
\seealso{
\code{\link{pssm-class}},
\code{\link{pssm-package}},
\code{\link{pssm.generate.data}},
\code{\link{pssm.object}},
\code{\link{pssm}},
\code{\link{pssm.survivalcurv}},
\code{\link{plot-methods}},
\code{\link{pssm.power}}
}

\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.
#creates 1 simulations with 50 observations
pss=pssm.simulate(nruns=1,theta1=.2,theta2=.2,phaz.progression=log(-log(.3)/4)*rep(1,3),
  phaz.survival=log(-log(.15)/4)*rep(1,6),accrual=1,followup=2,,m=3,n=50,rescale=1)
#Summary of run 1
summary(pss$objects[[1]][[1]])
}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ survival }
\keyword{ interval censoring }% __ONLY ONE__ keyword per line
\keyword{ progression free survival}
