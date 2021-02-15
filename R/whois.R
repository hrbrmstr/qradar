#' Retrieve the raw WHOIS record for a given autonomous system
#'
#' @param asn autonomous system number; should be just the number but
#'        the function will also work if the input is prefixed with
#'        "AS" or "as"
#' @return character
#' @export
#' @examples
#' qr_whois("7015")
qr_whois <- function(asn) {

  asn <- gsub("[^[:digit:]]", "", as.character(asn[1]))

  httr::GET(
    url = sprintf("https://radar.qrator.net/as%s/getwhois", asn),
    httr::add_headers(
      `Connection` = "keep-alive",
      `Accept` = "application/json, text/javascript, */*; q=0.01",
      `User-Agent` = "Mozilla/5.0 (Macintosh; Intel Mac OS X 11_3_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.47 Safari/537.36 Edg/89.0.774.27",
      `X-Requested-With` = "XMLHttpRequest",
      `Sec-Fetch-Site` = "same-origin",
      `Sec-Fetch-Mode` = "cors",
      `Sec-Fetch-Dest` = "empty",
      `Referer` = "https://radar.qrator.net/as7015/whois",
      `Accept-Language` = "en-US,en;q=0.9"
    ),
    httr::set_cookies(QRADARSESSION = "k9so4i4k4opvr92kf0psa0sm85") # good until 2072
  ) -> res

  httr::stop_for_status(res)

  out <- httr::content(res, as = "text", encoding = "UTF-8")
  out <- jsonlite::fromJSON(out)

  out$entry

}