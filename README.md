![travis-ci](https://travis-ci.org/geezyx/whatmask.svg?branch=master)
[![Test Coverage](https://codeclimate.com/github/geezyx/whatmask/badges/coverage.svg)](https://codeclimate.com/github/geezyx/whatmask/coverage)
[![Code Climate](https://codeclimate.com/github/geezyx/whatmask/badges/gpa.svg)](https://codeclimate.com/github/geezyx/whatmask)
[![Issue Count](https://codeclimate.com/github/geezyx/whatmask/badges/issue_count.svg)](https://codeclimate.com/github/geezyx/whatmask)
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
