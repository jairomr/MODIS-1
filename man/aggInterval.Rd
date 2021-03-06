% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/aggInterval.R
\name{aggInterval}
\alias{aggInterval}
\title{Create Periods for Temporal Composites}
\usage{
aggInterval(x, interval = c("month", "year", "fortnight"))
}
\arguments{
\item{x}{\code{Date} object, see eg default value of 'timeInfo' in 
\code{\link{temporalComposite}}.}

\item{interval}{\code{character}. Time period for aggregation. Currently
available options are "month" (default), "year" and "fortnight" (i.e., every 
1st and 15th day of the month).}
}
\value{
A \code{list} with the following slots:

\itemize{
\item{\code{$begin}: The start date(s) of each (half-)monthly timestep as
\code{Date} object.}
\item{\code{$end}: Same for end date(s).}
\item{\code{$beginDOY}: Similar to \code{$begin}, but with \code{character}
objects in MODIS-style date format (i.e., "\%Y\%j"; see \code{\link{strptime}}).}
\item{\code{$endDOY}: Same for end date(s).}
}
}
\description{
The creation of custom temporal aggregation levels (e.g., half-monthly,
monthly) from native 16-day MODIS composites usually requires the definition
of date sequences based on which the "composite_day_of_the_year" SDS is
further processed. Complementing \code{\link{transDate}}, which returns the
respective start and end date only, this function creates full-year
(half-)monthly or annual composite periods from a user-defined temporal range.
}
\examples{
dates <- do.call("c", lapply(2015:2016, function(i) {
  start <- as.Date(paste0(i, "-01-01"))
  end <- as.Date(paste0(i, "-12-31"))
  seq(start, end, 16)
}))

intervals <- c("month", "year", "fortnight")
lst <- lapply(intervals, function(i) {
  aggInterval(dates, interval = i)
}); names(lst) <- intervals

print(lst)

}
\seealso{
\code{\link{transDate}}.
}
\author{
Florian Detsch
}
