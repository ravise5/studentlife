% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dev_helpers.R
\name{is_SL_tibble}
\alias{is_SL_tibble}
\title{is_SL_tibble}
\usage{
is_SL_tibble(x)
}
\arguments{
\item{x}{Any object}
}
\value{
Logical
}
\description{
Confirm that an object is a StudentLife tibble
}
\examples{
\donttest{
d <- "D:/Datasets/studentlife"
download_studentlife(dest = d)

tab_PAM <- load_SL_tibble(schema = "EMA", table = "PAM", location = d)

# Returns TRUE
is_SL_tibble(tab_PAM)
}

}