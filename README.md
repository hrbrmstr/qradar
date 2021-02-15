
[![Project Status: Active – The project has reached a stable, usable
state and is being actively
developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![Signed
by](https://img.shields.io/badge/Keybase-Verified-brightgreen.svg)](https://keybase.io/hrbrmstr)
![Signed commit
%](https://img.shields.io/badge/Signed_Commits-100%25-lightgrey.svg)
[![Linux build
Status](https://travis-ci.org/hrbrmstr/qradar.svg?branch=master)](https://travis-ci.org/hrbrmstr/qradar)  
![Minimal R
Version](https://img.shields.io/badge/R%3E%3D-3.6.0-blue.svg)
![License](https://img.shields.io/badge/License-MIT-blue.svg)

# qradar

Gather Autonomous System, IP Address, and Routing Information from
Qrator Radar

## Description

Qrator has an API (<https://api.radar.qrator.net/>) that can be queried
for information on autonomous systems, IP addresses, and various
internet routing metadata. Tools are provided to perform these queries
and retrieve resultsets. Note that an account is needed to generate the
free API key which is required for all API calls.

## What’s Inside The Tin

The following functions are implemented:

-   `qr_api_key`: Get or set QRATOR\_RADAR\_API\_KEY value
-   `qr_ip_lookup`: Get list of Prefixes/ASNs for selected IP
-   `qr_tidy`: Turn a Qrator Radar raw API result into a data frame
-   `qr_whois`: Retrieve the raw WHOIS record for a given autonomous
    system

## TODO

The rest of [the API](https://api.radar.qrator.net/).

## Installation

``` r
remotes::install_git("https://git.rud.is/hrbrmstr/qradar.git")
# or
remotes::install_gitlab("hrbrmstr/qradar")
# or
remotes::install_bitbucket("hrbrmstr/qradar")
# or
remotes::install_github("hrbrmstr/qradar")
```

NOTE: To use the ‘remotes’ install options you will need to have the
[{remotes} package](https://github.com/r-lib/remotes) installed.

## Usage

``` r
library(qradar)

# current version
packageVersion("qradar")
## [1] '0.1.0'
```

``` r
qr_tidy(qr_ip_lookup("17.253.144.10"))
##    id              name short_descr          prefix as_num       found_ips
## 1 714 APPLE-ENGINEERING                  17.0.0.0/8    714 {17.253.144.10}
## 2 714 APPLE-ENGINEERING                17.128.0.0/9    714 {17.253.144.10}
## 3 714 APPLE-ENGINEERING               17.253.0.0/16    714 {17.253.144.10}
## 4 714 APPLE-ENGINEERING             17.253.144.0/21    714 {17.253.144.10}

cat(qr_whois("7015"))
## ASNumber:       7015
## ASName:         COMCAST-7015
## ASHandle:       AS7015
## RegDate:        2001-12-20
## Updated:        2021-01-25
## Ref:            https://rdap.arin.net/registry/autnum/7015
## 
## OrgName:        Comcast Cable Communications, LLC
## OrgId:          CCCS
## Address:        1800 Bishops Gate Blvd
## City:           Mt Laurel
## StateProv:      NJ
## PostalCode:     08054
## Country:        US
## RegDate:        2001-09-18
## Updated:        2020-11-18
## Ref:            https://rdap.arin.net/registry/entity/CCCS
## 
## OrgTechHandle: IC161-ARIN
## OrgTechName:   Comcast Cable Communications Inc
## OrgTechPhone:  +1-856-317-7200
## OrgTechEmail:  CNIPEO-Ip-registration@cable.comcast.com
## OrgTechRef:    https://rdap.arin.net/registry/entity/IC161-ARIN
## 
## OrgRoutingHandle: ROUTI25-ARIN
## OrgRoutingName:   Routing
## OrgRoutingPhone:  +1-856-317-7200
## OrgRoutingEmail:  routing@comcast.com
## OrgRoutingRef:    https://rdap.arin.net/registry/entity/ROUTI25-ARIN
## 
## OrgAbuseHandle: NAPO-ARIN
## OrgAbuseName:   Network Abuse and Policy Observance
## OrgAbusePhone:  +1-888-565-4329
## OrgAbuseEmail:  abuse@comcast.net
## OrgAbuseRef:    https://rdap.arin.net/registry/entity/NAPO-ARIN
```

## qradar Metrics

| Lang | \# Files |  (%) | LoC |  (%) | Blank lines |  (%) | \# Lines | (%) |
|:-----|---------:|-----:|----:|-----:|------------:|-----:|---------:|----:|
| R    |        7 | 0.44 |  60 | 0.43 |          23 | 0.27 |       49 | 0.3 |
| Rmd  |        1 | 0.06 |  10 | 0.07 |          19 | 0.23 |       32 | 0.2 |
| SUM  |        8 | 0.50 |  70 | 0.50 |          42 | 0.50 |       81 | 0.5 |

clock Package Metrics for qradar

## Code of Conduct

Please note that this project is released with a Contributor Code of
Conduct. By participating in this project you agree to abide by its
terms.
