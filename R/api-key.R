#' Get or set QRATOR_RADAR_API_KEY value
#'
#' The API wrapper functions in this package all rely on a Qrator Radar API
#' key residing in the environment variable \code{QRATOR_RADAR_API_KEY}. The
#' easiest way to accomplish this is to set it in the `\code{.Renviron}` file in your
#' home directory.
#'
#' @param force force setting a new Qrator Radar API key for the current environment?
#' @return atomic character vector containing the Qrator Radar API key
#' @export
qr_api_key <- function(force = FALSE) {

  env <- Sys.getenv('QRATOR_RADAR_API_KEY')
  if (!identical(env, "") && !force) return(env)

  if (!interactive()) {
    stop("Please set env var QRATOR_RADAR_API_KEY to your Qrator Radar API key",
      call. = FALSE)
  }

  message("Couldn't find env var QRATOR_RADAR_API_KEY See ?QRATOR_RADAR_API_KEY for more details.")
  message("Please enter your API key and press enter:")
  pat <- readline(": ")

  if (identical(pat, "")) {
    stop("Qrator Radar API key entry failed", call. = FALSE)
  }

  message("Updating QRATOR_RADAR_API_KEY env var to PAT")
  Sys.setenv(QRATOR_RADAR_API_KEY = pat)

  pat

}
