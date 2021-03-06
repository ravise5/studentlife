% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/SL_tbl_trans.R
\name{add_block_labels}
\alias{add_block_labels}
\title{add_block_labels}
\usage{
add_block_labels(tab, type = c("hour_in_day", "epoch", "day", "week",
  "weekday", "month", "date"), interval = "start", warning = TRUE,
  start_date = getOption("SL_start"),
  epoch_levels = getOption("SL_epoch_levels"),
  epoch_ubs = getOption("SL_epoch_ubs"), unsafe = F)
}
\arguments{
\item{tab}{An \code{SL_tibble} as returned
by the function \code{\link[studentlife]{load_SL_tibble}}.}

\item{type}{A character vector of block label types
to include. Can be one or more of "epoch", "day",
"week", "weekday", "month" and "date". Any block label types that
are not inferrable from the available date-time data are ignored.}

\item{interval}{A character string that decides how block
membership is decided when \code{tab} is of class
\code{interval_SL_tibble}. Can be either "start"
(use \code{start_timestamp}),
"end" (use \code{end_timestamp}) or "middle" (use the midpoint between
\code{start_timestamp} and \code{end_timestamp}).}

\item{warning}{Logical. If \code{TRUE} then a warning is produced
whenever a block label type is not inferrable from the
available date-time data.}

\item{start_date}{Date. The date that the StudentLife study started.}

\item{epoch_levels}{A character vector of epoch levels.}

\item{epoch_ubs}{An integer vector that defines the hour that is
the upper boundary of each epoch.}

\item{unsafe}{A logical. Default is \code{FALSE}. If this is
set to \code{TRUE} then less checks will be performed.}
}
\description{
Classify observations from an \code{SL_tibble}
into block labels using available
date-time information. See more information
about "blocks" under the details section.
Daylight savings is ignored, and started on 31st March 2013.
}
\details{
Block label types can be one or more of "epoch"
(giving labels morning, evening, afternoon and night),
"day" (giving number of days since the \code{start_date} of the
StudentLife study),
"week" (giving integer number of weeks since the first week of the
StudentLife study, rounded downs),
"weekday" (giving the day of the week),
"month" (giving integer number of months since the start of the
StudentLife study, rounded down) and "date".
}
\examples{
d <- tempdir()
download_studentlife(location = d, url = "testdata")

tab <- load_SL_tibble(
  loc = d, schema = "sensing", table = "activity", csv_nrows = 10)

b_tab <- add_block_labels(tab)
b_tab


}
