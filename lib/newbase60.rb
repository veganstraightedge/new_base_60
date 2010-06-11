class Newbase60
  require "time"
  require "date"
  VERSION = '0.0.1'
  
  def initialize(str)
    @base_60 = str
  end
  
  # converts NewBase60 into base10 integer
  def to_i
    num = 0

    @base_60.length.times do |index| # iterate over each letter
      char = @base_60[index]         # grab the ascii value of the current letter

      if (48..57).include?(char)
        char -= 48
      elsif (65..72).include?(char)
        char -= 55
      elsif (char == 73 || char == 108) # typo capital I, lowercase l to 1
        char = 1
      elsif (74..78).include?(char)
        char -= 56
      elsif (char == 79) # error correct typo capital O to 0
        char = 0
      elsif (80..90).include?(char)
        char -= 57
      elsif (char==95) # underscore
        char = 34
      elsif (97..107).include?(char)
        char -= 62
      elsif (109..122).include?(char)
        char -= 63
      else
        char = 0 # treat all other noise as 0
      end

      num = 60 * num + char
    end

    num
  end

  # converts NewBase60 characters into a Time object
  def to_time
    # days since epoch * seconds * minutes * hours + timezone 
    Time.at(Newbase60.new(@base_60).to_i * 60 * 60 * 24 + Time.now.gmtoff.abs)
    # 14:48 on 2010-06-04
  end
end

class Integer
  # converts base10 integers into NewBase60
  def to_sxg
    num = self

    sxg        = ""
    vocabulary = "0123456789ABCDEFGHJKLMNPQRSTUVWXYZ_abcdefghijkmnopqrstuvwxyz"

    return 0 if num.nil? || num.zero?

    while num > 0 do
      mod = num % 60
      sxg = "#{vocabulary[mod,1]}#{sxg}"
      num = (num - mod) / 60
    end

    sxg
  end

  # converts base10 integers into NewBase60 padding with leading zeroes
  def to_sxgf(padding)
    num = self

    str = num.to_sxg

    padding = 1 if padding.nil?
    padding -= str.length

    while padding > 0
      str = "0#{str}"
      padding -= 1
    end

    str
  end
end

# converts Time object into NewBase60
class Time
  def to_sxg
    the_when   = self + Time.now.gmtoff.abs
    epoch_days = the_when.to_i / 60 / 60 / 24
    epoch_days.to_sxg
  end
end
