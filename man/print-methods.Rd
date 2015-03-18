\name{print-methods}
\docType{methods}
\alias{print,ANY-method}
\alias{print,pssm-method}
\alias{print,pssm.summary-method}
\title{ Print method for \code{print} in Package \pkg{pssm} }
\description{
Prints a summary of a pssm object
}
\section{Methods}{
\describe{
\item{\code{signature(x = "pssm")}}{
creates a pssm.summary object and prints it.
The pssm.summary object has the estimate of the covariate coefficients and their standard errors.
}
\item{\code{signature(x = "pssm.summary")}}{
Prints the summary object
}
}}
\keyword{methods}
\seealso{
\code{\link{pssm-package}},
\code{\link{pssm.generate.data}},
\code{\link{pssm.object}}
\code{\link{pssm}},
\code{\link{pssm.simulate}},
\code{\link{pssm.survivalcurv}}
\code{\link{pssm-class}}
\code{\link{pssm.power}}
}
