% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/api-key.R
\name{qr_api_key}
\alias{qr_api_key}
\title{Get or set QRATOR_RADAR_API_KEY value}
\usage{
qr_api_key(force = FALSE)
}
\arguments{
\item{force}{force setting a new Qrator Radar API key for the current environment?}
}
\value{
atomic character vector containing the Qrator Radar API key
}
\description{
The API wrapper functions in this package all rely on a Qrator Radar API
key residing in the environment variable \code{QRATOR_RADAR_API_KEY}. The
easiest way to accomplish this is to set it in the \verb{\code{.Renviron}} file in your
home directory.
}
