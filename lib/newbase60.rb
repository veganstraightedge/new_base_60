require "date"
require "time"

class Newbase60
  VERSION = '1.0.1'
  VOCABULARY = "0123456789ABCDEFGHJKLMNPQRSTUVWXYZ_abcdefghijkmnopqrstuvwxyz"

  def initialize(base_60)
    @base_60 = base_60
  end

  def to_s
    @base_60
  end

  # Converts into a base 10 integer.

  def to_i
    num = 0

    @base_60.bytes do |char|
      case char
      when 48..57   then char -= 48
      when 65..72   then char -= 55
      when 73, 108  then char  = 1  # typo capital I, lowercase l to 1
      when 74..78   then char -= 56
      when 79       then char  = 0  # error correct typo capital O to 0
      when 80..90   then char -= 57
      when 95       then char  = 34
      when 97..107  then char -= 62
      when 109..122 then char -= 63
      else               char  = 0  # treat all other noise as 0
      end

      num = 60 * num + char
    end

    num
  end

  # Converts into a Date.

  def to_date
    # HACK this is smelly

    # days since epoch * seconds * minutes * hours + timezone
    time = Time.at(Newbase60.new(@base_60).to_i *
                   60 * 60 * 24 + Time.now.gmtoff.abs)

    Date.parse(time.strftime("%Y/%m/%d"))
  end
end

class Integer

  # Converts a base 10 integer into a NewBase60 string.

  def to_sxg
    return "" if zero?

    num = self
    sxg = ""

    while num > 0 do
      mod = num % 60
      sxg = "#{Newbase60::VOCABULARY[mod,1]}#{sxg}"
      num = (num - mod) / 60
    end

    sxg
  end

  # Converts a base 10 integer into a NewBase60 string, padding with
  # leading zeroes.

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

class Date

  # Converts into a NewBase60 string.

  def to_sxg
    (self - Date.parse("1970/01/01")).to_i.to_sxg
  end
end
