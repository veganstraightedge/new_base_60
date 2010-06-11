= newbase60

* http://github.com/veganstraightedge/NewBase60

== DESCRIPTION:

Handy Conversion Sexagesimal (base 60) for Short URLs
Cuts out ambiguous characters like:
l : lowercase l (looks like a 1 : one)
I : capital   I (looks like a 1 : one)
O : capital   O (looks like a 0 : zero)

== FEATURES/PROBLEMS:

* Converts Base10 (like 147124) to Base60 (like fs4)
* Converts Base60 (like fs4) to Base60 (like 147124)
* Converts Base60 (like fs4) to a Time object (Mon Oct 23 23:00:00 -0800 2372)

== SYNOPSIS:

n = Newbase60.new("3x0")
puts n.to_i             # => 14220
puts n.to_i.to_sxg      # => "3x0"
puts n.to_time          # => Sat Jan 03 23:00:00 -0800 1970
puts n.to_time.to_sxg   # => 3

* Note: I know I'm losing some resolution in the time conversion. I'm working on it.

== INSTALL:

* sudo gem install newbase60

== LICENSE:

PUBLIC DOMAIN.
Your heart is as free as the air you breathe.
The ground you stand on is liberated territory.