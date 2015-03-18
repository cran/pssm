\name{pssm.power}
\alias{pssm.power}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{A function to calculate the power for \code{pssm}
%%  ~~function to do ... ~~
}
\description{ This function calculates the power, the sample size required for a given power, or the value of the parameter(delta) for a given sample size and power for testing for treatment effect on time to progression and for test for non-inferiority in terms of the survival at a fixed time point} 

\usage{pssm.power(parameter=c("N","Delta","Power","Power-Simulation"),
endpoint=c("Progression","Survival"),progression.delta=0.2 ,nsamp=100,alpha=0.025,
pow=0.80,tsurv=3,h0=0,prior.surv=0,alloc=c(1,1),phaz=log(.2),shaz=log(.2),accrual=3,
followup=2,inc=0.05,delta=0,intervals=1,nsims=500,n=5000,seed=NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{parameter}{
  A character vector of parameters to be calculated.  For "N", "Delta" and "Power" the calculation proceeds by first calculating the standard error of the parameter measuring the treatment effect in a trial with \code{n} (default 3000) patients it then multiplies by the square root of \code{n} to get the proper factor to calculate the parameter called for. For "Power-Simulation" it runs a simulation to calculate the power for a specified sample size \code{nsamp} and \code{progression.delta}. This was included as a check on the asymptotics which is the basis of using one simulation to get a standard error and then scaling up or down to calculate the sample size or detectable difference. 
}
  \item{endpoint}{ A character vector with either \code{"Progression"} or \code{"Survival"}.  In the first case it assumes that endpoint for which the sample size is being calculated is the parameter measuring the effect of treatment on the time to progression, which is log of the hazard ratio of placebo to active treatment. In the second it is the difference in the survival curves at the time \code{tsurv}}
  \item{progression.delta}{
  The log of the hazard ratio of placebo to active treatment. This used to calculate the sample size \code{"N"} and \code{"Power"}.  When Survival is the endpoint it is used to calculate the survival difference due to the effect of time to progression on overall survival.

}
  \item{nsamp}{ This is the sample size used to calculate 
  \code{"Power"} or \code{"Delta"}.
}
  \item{alpha}{ The one sided significance level to be used.

}
  \item{pow}{ The power required. This is used in the calculation of \code{"N"} and \code{"Delta"}.

}
  \item{tsurv}{ The time used for the survival difference.

}
  \item{h0}{ The non-inferiority boundary for the survival difference given as a positive number.

}
  \item{prior.surv}{ The prior precision of the parameter that measures the effect of treatment on survival after progression.  Note that this is \eqn{1/\sigma^2} where \eqn{\sigma} is the prior standard deviation of this parameter.}
  \item{alloc}{Allocation between control and treatment group \code{c(1,1)} is one to one allocation.
}
  \item{phaz}{ Log hazard of progression in the placebo group
}
  \item{shaz}{ Log hazard of survival after progression in the placebo and treatment group
}
  \item{accrual}{ Accrual period
}
  \item{followup}{Follow up period.
}
  \item{inc}{Time period between visits for acessing progression.
}
  \item{delta}{Variation around visit times
}
  \item{intervals}{Number of intervals to fit hazards
}
  \item{nsims}{Number of simulations
}
  \item{n}{Sample size used to estimate the standard Error.
}
  \item{seed}{Seed for the random number generator if you don't want the data that is analyzed to change.}
}

\value{ A data frame is returned with variables, "parameter", "endpoint" and "value".}

\author{
David A. Schoenfeld
}


\seealso{
\code{\link{pssm-class}},
\code{\link{pssm-package}},
\code{\link{pssm.generate.data}},
\code{\link{pssm.object}},
\code{\link{pssm}},
\code{\link{pssm.simulate}},
\code{\link{pssm.survivalcurv}},
\code{\link{plot-methods}}
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.
pssm.power(parameter="Power",progression.delta=.4,nsamp=450,h0=0.04,nsims=100)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{Sample Size}
\keyword{Power}% __ONLY ONE__ keyword per line
