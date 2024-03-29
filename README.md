[![Gem Version](https://badge.fury.io/rb/whatmask.svg)](https://badge.fury.io/rb/whatmask)
[![CircleCI](https://dl.circleci.com/status-badge/img/gh/geezyx/whatmask/tree/main.svg?style=svg)](https://dl.circleci.com/status-badge/redirect/gh/geezyx/whatmask/tree/main)
[![Test Coverage](https://api.codeclimate.com/v1/badges/113c95a91a5053c78b7d/test_coverage)](https://codeclimate.com/github/geezyx/whatmask/test_coverage)
[![Maintainability](https://api.codeclimate.com/v1/badges/113c95a91a5053c78b7d/maintainability)](https://codeclimate.com/github/geezyx/whatmask/maintainability)
# Whatmask

Whatmask is a command-line tool originally written by Jim Laffey (http://www.laffeycomputer.com/whatmask.html) and released with a GPL license.  This is a ruby rewrite of whatmask, providing the same functionality of the original utility (will maybe add more).

### Installation

```
gem install whatmask
```

### Instructions

Once installed, you should have a command-line tool available in your console.
```
whatmask
```
Without any parameters, the command will output the following help instructions:
```
whatmask may be used two ways:

Given a mask:          whatmask <CIDR bits>
               - or -  whatmask <subnet mask>
               - or -  whatmask <hex subnet mask>
               - or -  whatmask <wildcard bit mask>
 NOTE: whatmask will autodetect the input and show you all four.

Given an ip/mask:      whatmask <IP address>/<netmask>
       <netmask> may be one of the following:
                       CIDR notation (e.g. "24")
                       Netmask notation (e.g. "255.255.255.0")
                       Hex Netmask notation (e.g. "0xffffff00")
                       Wildcard bits notation (e.g. "0.0.0.255")
 NOTE: whatmask will autodetect the netmask format.
```

###To Do

Add better error checking for inputs. Add some autofill or next available type functions.
