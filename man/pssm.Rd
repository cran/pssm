\name{pssm}
\alias{pssm}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Fits a joint piecewise exponential model for progression and survival
%%  ~~function to do ... ~~
}
\description{'pssm' fits a proportional hazards model where the underlying hazard of time to progression 
and subsequent survival are both piecewise constant. The hazard from progression to death is different for 
each interval for which the hazard of progression is constant. The covariates for progression and death after progression
may be different. Time to progression is interval censored while time to death is right censored. Patients who die must have 
a progression interval with a right endoint that is at or before the death time.


%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
pssm(progr, survv, dat, intervals = 5, start = NULL, rescale = 1)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{progr}{a formula object of the form Surv(time0,time1)~covariates for the time to progression, 
  if NULL it fits a piecewise exponential model for survival time only. The progression time is assumed to be 
  interval censored between time0 and time1.
  If progression does not occur then time1=NA.
%%     ~~Describe \code{progr} here~~
}
  \item{survv}{a formula object of the form Surv(time,cns)~covariates for time from 
  progression to death, if NULL a model for time to progression is fit. The code for "cns" is 1=dead, 0=alive.
%%     ~~Describe \code{survv} here~~
}
  \item{dat}{A data frame with the data used in the estimation
%%     ~~Describe \code{dat} here~~
}
  \item{intervals}{An integer indicating the number of intervals in the time to progression or survival model.  If both \emph{progr} and \emph{survv}
  are present than \emph{intervals} is the number of intervals for the progession model.  The survival model will have \emph{intervals*(intervals+1)/2} hazard parameters.
  If the model doesn't converge the number of intervals will be reduced by the program until convergence occurs.
%%     ~~Describe \code{intervals} here~~
}
  \item{start}{starting values for the parameter vector, suppose \code{intervals=m} and there are \eqn{n_1} progression covariates and \eqn{n_2} survival covariates
  then the parameter vector will be of length,
   \eqn{m+m(m+1)/2+n_1+n_2} the survival covariates are ordered by progression interval 
  i.e the first \eqn{m}, are survival intervals for patients who progressed between time 0 and 1,the next \eqn{m-1} or for patients who 
  progressed between time 1 and 2,\dots
  The first \eqn{m*(m+1)/2} elements are the log-survival hazard, the next \eqn{m} the log-progression hazard followed by the 
  progression covariate vector followed by the survival covariate vector.
  If NULL the starting values are estimated.
%%     ~~Describe \code{start} here~~
}
  \item{rescale}{A number that will multiply the survival and progression times before processing.  This will be changed by the program if the maximum 
  survival or progression time is greater than \eqn{m r}.  
%%     ~~Describe \code{rescale} here~~
}
}

\value{An S4 \code{\link{pssm.object}} containing the estimated parameters, their standard errors, 
their variance covariance matrix, and details of the model that was fit. The generic functions plot, summary and print are defined for the object.
  
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
\code{\link{pssm.simulate}},
\code{\link{pssm.survivalcurv}},
\code{\link{plot-methods}},
\code{\link{pssm.power}}
\code{\link{pssm.noninferiority.boundary}}
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.
#generate data
set.seed(359)
u<-pssm.generate.data(theta1=.5,theta2=0,phaz.progression=rep(log(-log(.3)/4),5),	
phaz.survival=rep(log(-log(.2)/4),15),accrual=2,followup=2.9,m=5,n=100,times=c(.8,2.1,3.4))
#estimate based on joint model
ps<-pssm(surv(tprog0,tprog1)~rx,surv(tdeath,cdeath)~rx,u,intervals=3,rescale=1)
summary(ps)
plot(ps,type='survival',cov1=matrix(c(1,0),2,1),cov2=matrix(c(1,0),2,1))
plot(ps)
plot(ps,type='progression',cov1=matrix(c(1,0),2,1),cov2=matrix(c(1,0),2,1))
#estimate time to progression only (tumor free survival)
ps1=pssm(surv(tprog0,tprog1)~rx,NULL,u,intervals=3,rescale=1)
summary(ps1)
plot(ps1)
plot(ps1,type='progression',cov1=matrix(c(1,0),2,1),cov2=matrix(c(1,0),2,1))
#estimate survival only
ps2=pssm(NULL,surv(tdeath,cdeath)~rx,u,intervals=3,rescale=1)
summary(ps2)
plot(ps2)
plot(ps2,type='survival',cov1=matrix(c(1,0),2,1),cov2=matrix(c(1,0),2,1))
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ survival }
\keyword{ interval censoring }% __ONLY ONE__ keyword per line
\keyword{ progression free survival}