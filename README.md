# New Base 60

https://github.com/veganstraightedge/new_base_60


## Description

Handy Conversion Sexagesimal (base 60) for Short URLs
Cuts out ambiguous characters like:

* `l` : lowercase `L` (looks like a `1` : one)
* `I` : capital   `i` (looks like a `1` : one)
* `O` : capital   `o` (looks like a `0` : zero)

Based on work done by Tantek Çelik : [http://ttk.me/w/NewBase60](http://ttk.me/w/NewBase60 "tantek / NewBase60")

## Features/Problems

* Converts Base10 (like 147124) to Base60 (like fs4)
* Converts Base60 (like fs4) to Base10 (like 147124)
* Converts Base60 (like fs4) to a Time object (Mon Oct 23 23:00:00 -0800 2372)

## Synopsis

How to use:

```ruby
require "new_base_60"
n = NewBase60.new("464")# => #<NewBase60:0x1011ea468 @base_60="464">
puts n.to_i             # => 14764
puts n.to_i.to_sxg      # => "464"
puts n.to_date          # => #<Date: 4910703/2,0,2299161>
puts n.to_date.to_s     # => "2010-06-04"
puts n.to_date.to_sxg   # => "464"
```

Or, on the command line:

```bash
$ dec_to_sxg 115727
Y8n
$ sxg_to_dec Y8n
115727
```

If you want a shortcut, add this to your .bash_profile:

```bash
alias sd="sxg_to_dec"
alias ds="dec_to_sxg"
```

## Install

```bash
sudo gem install new_base_60
```

# Credits
## Contributors

* [Original Idea](http://tantek.com/w/NewBase60 "tantek / NewBase60") : [Tantek Çelik](http://tantek.com "tantek.com") ([@tantek](https://github.com/tantek))
* Ruby Port : [Shane Becker](http://iamshane.com "I&#x27;m Shane Becker") ([@veganstraightedge](https://github.com/veganstraightedge))
* [John Barnette](http://www.jbarnette.com "John Barnette") ([@jbarnette](https://github.com/jbarnette))
* [Ivan Storck](http://ivanoats.com "Ivan Storck") ([@ivanoats](https://github.com/ivanoats))
* [Bookis Smuin](https://twitter.com/bookis) ([@bookis](https://github.com/bookis))
* [Chris Raethke](https://github.com/veganstraightedge/new_base_60/commit/725bbcc8f05016bca59a2643cc03cc25f14eedd0)
* [Faun](http://www.saschawinter.com "Sascha Faun Winter") ([@faun](https://github.com/faun))
* [Aaron Parecki](http://aaronparecki.com "Aaron Parecki") ([@aaronpk](https://github.com/aaronpk))




## License

**PUBLIC DOMAIN**

Your heart is as free as the air you breathe. <br>
The ground you stand on is liberated territory.

In legal text, new_base_60 is dedicated to the public domain
using Creative Commons -- CC0 1.0 Universal.

[http://creativecommons.org/publicdomain/zero/1.0](http://creativecommons.org/publicdomain/zero/1.0 "Creative Commons &mdash; CC0 1.0 Universal")
