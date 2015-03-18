\name{pssm.survivalcurv}
\alias{pssm.survivalcurv}
%%- Also NEED an '\alias' for EACH other topic documented here.
\title{time to progression and time to death function for a "pssm" object
%%  ~~function to do ... ~~
}
\description{Generates a function of time for specified covariate values from a "pssm" object created by pssm that fits a joint proportional hazards and survival model using a piecewise 
exponential underlying hazard function
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
pssm.survivalcurv(x, cov1, cov2, timeToProgression = FALSE, covariance = TRUE)
%%- maybe also 'usage' for other objects documented here.
}
\arguments{
  \item{x}{A pssm object created by pssm
%%     ~~Describe \code{x} here~~
}
  \item{cov1}{a \eqn{a*b} matrix of values of the \eqn{b} covariates affecting the time to progession
%%     ~~Describe \code{cov1} here~~
}
  \item{cov2}{a matrix of values of the covariates affecting survival after progression with the same number of rows as cov1
%%     ~~Describe \code{cov2} here~~
}
  \item{timeToProgression}{if FALSE estimates the survival curve, if TRUE estimates two probabilities, the probability of being disease free before t and the probability 
  of progressing before t but surviving after t
%%     ~~Describe \code{timeToProgression} here~~
}
  \item{covariance}{if TRUE the covariance matrix is returned as an attribute of the function value
%%     ~~Describe \code{covariance} here~~
}
}
\details{pssm.survivalcurv returns a function the argument of which is the vector of times for which survival probabilities are desired. 

%%  ~~ If necessary, more details than the description above ~~
}
\value{A function is returned, the input to the function is a vector of times, and an optional parameter indicating the prior precision on the estimate of the -log hazard ratio of the effect of survival after progression on the last covariate in the survival model (presumed to be treatment) and the output is a data frame with columns described below:

Note that to conduct the bayesian analysis the Covariance needs to be set to T.

\item{rep}{indicates what is estimated (see below), values are "s1" or "s2"}
\item{time}{Time, \eqn{t}}
\item{covariates}{Columns indicating covariates for survival and progression}
\item{estimate}{Estimate, If timeToProgession is TRUE and the estimation was done with both survival and time to progession the "s1" value is the probability that a patient will progress before time \eqn{t} but survive longer than \eqn{t}. In that case the value at "s2" is the probability a patient will be disease free before \eqn{t}. Otherwise rep will only equal "s1" and it will be the probability that survival or progression occurs latter than \eqn{t} as the case may be.
}
}
%%\references{
%% ~put references to the literature/web site here ~}
\author{ David A. Schoenfeld
%%  ~~who you are~~
}


%% ~Make other sections like Warning with \section{Warning }{....} ~


\seealso{
\code{\link{pssm-class}},
\code{\link{pssm-package}},
\code{\link{pssm.generate.data}},
\code{\link{pssm.object}},
\code{\link{pssm}},
\code{\link{pssm.simulate}},

\code{\link{plot-methods}},
\code{\link{pssm.power}}
}

\examples{
#generate data for plot
u<-pssm.generate.data(theta1=.5,theta2=0,phaz.progression=rep(log(-log(.3)/4),5),	
    phaz.survival=rep(log(-log(.15)/4),15),accrual=2,followup=2.9,m=5,
    n=50,times=c(1,2,3),delta=0.5)
#estimate parameters
ps<-pssm(surv(tprog0,tprog1)~rx,surv(tdeath,cdeath)~rx,dat=u,intervals=3)
#calculate survival curves
vs<-pssm.survivalcurv(ps,cov1=matrix(c(0,1),2,1),cov2=matrix(c(0,1),2,1),covariance=TRUE)
t=c(0,2,4,4.99)
curves=vs(t)
#plot survival curves
plot(t,curves$estimate[curves$rx==0],type='l',lty=2,ylim=c(0,1),
     main='Survival Curve',xlab='Time',ylab='Probability of Survival')
points(t,curves$estimate[curves$rx==1],type='l',lty=1,xlim=c(0,5))
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ survival }
\keyword{ interval censoring }% __ONLY ONE__ keyword per line
\keyword{ progression free survival}