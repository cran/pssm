\name{pssm.noninferiority.boundary}
\alias{pssm.noninferiority.boundary}
%%- Also NEED an '\alias' for EACH other topic documented here.
\title{Non inferiority boundary as a function of the prior precision}
%%  ~~function to do ... ~~

\description{Generates a function of time for specified covariate values from a "pssm" object created by pssm that fits a joint proportional hazards and survival model using a piecewise 
exponential underlying hazard function
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
pssm.noninferiority.boundary(x,time,cov1,cov2,
                                       approximate=TRUE,alpha=0.05,iterations=50000)
%%- maybe also 'usage' for other objects documented here.
}
\arguments{
  \item{x}{A pssm object created by pssm
%%     ~~Describe \code{x} here~~
}
  \item{time}{The time point at which the treatments are to be compared}
  \item{cov1}{a \eqn{a*b} matrix of values of the \eqn{b} covariates affecting the time to progession
%%     ~~Describe \code{cov1} here~~
}
  \item{cov2}{a matrix of values of the covariates affecting survival after progression with the same number of rows as cov1
%%     ~~Describe \code{cov2} here~~
}
  \item{approximate}{If false it uses a metropolis hasting MCMC to calculate the upper boundary otherwise it uses a normal approximation for the posterior}
  \item{alpha}{The one sided alpha level of the bound}
   \item{iterations}{Number of MCMC iterations, only used if approximate=FALSE} 
}

\value{A function is returned that takes a vector input. For each element the function outputs the lower alpha confidence bound of the survival difference}

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


% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ survival }
\keyword{ interval censoring }% __ONLY ONE__ keyword per line
\keyword{ progression free survival}