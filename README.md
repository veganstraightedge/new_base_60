# New Base 60

http://github.com/veganstraightedge/new_base_60

## Description

Handy Conversion Sexagesimal (base 60) for Short URLs
Cuts out ambiguous characters like:

* l : lowercase l (looks like a 1 : one)
* I : capital   I (looks like a 1 : one)
* O : capital   O (looks like a 0 : zero)

Based on work done by Tantek Çelik : [http://tantek.pbworks.com/New_base_60](http://tantek.pbworks.com/New_base_60 "tantek / New_base_60")

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

* Original Idea : Tantek Çelik (@tantek)
* Ruby Port : Shane Becker (@veganstraightedge)
* Lotsa Cleanup : John Barnette (@jbarnette)
* Command Line Scripts : Aaron Parecki (@aaronpk)



## License

**PUBLIC DOMAIN**

Your heart is as free as the air you breathe. <br>
The ground you stand on is liberated territory.

In legal text, new_base_60 is dedicated to the public domain
using Creative Commons -- CC0 1.0 Universal.

[http://creativecommons.org/publicdomain/zero/1.0](http://creativecommons.org/publicdomain/zero/1.0 "Creative Commons &mdash; CC0 1.0 Universal")
