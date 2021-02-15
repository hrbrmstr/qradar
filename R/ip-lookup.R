#' Get list of Prefixes/ASNs for selected IP
#'
#' @param ip IP to lookup
#' @param api_key your Qrator Radar API key; see [qr_api_key()].
#' @return list (use [qr_tidy()] to turn the raw API result into a data frame)
#' @export
#' @examples
#' qr_tidy(qr_ip_lookup("17.253.144.10"))
qr_ip_lookup <- function(ip, api_key = qr_api_key()) {

  httr::GET(
    url = "https://api.radar.qrator.net/v1/lookup/ip",
    httr::add_headers(`QRADAR-API-KEY` = api_key),
    httr::user_agent(.qradar_ua),
    query = list(query = ip[1])
  ) -> res

  httr::stop_for_status(res)

  out <- httr::content(res, as = "text", encoding = "UTF-8")
  out <- jsonlite::fromJSON(out)

  class(out) <- c("qr_ip", "list")

  out

}
