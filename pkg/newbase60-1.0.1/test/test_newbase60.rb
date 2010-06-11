require "test/unit"
require "newbase60"
require "date"

class TestNewbase60 < Test::Unit::TestCase
  def test_base60_to_base10
    assert_equal     Newbase60.new("464").to_i, 14764
    assert_not_equal Newbase60.new("464").to_i, 12345
  end

  def test_base60_to_date
    assert_equal     Newbase60.new("464").to_date, Date.parse("2010/06/04")
    assert_not_equal Newbase60.new("464").to_date, Date.parse("2010/06/05")
  end

  def test_date_to_base60
    assert_equal     Date.parse("2010/06/04").to_sxg, Newbase60.new("464").to_s
    assert_not_equal Date.parse("2010/06/05").to_sxg, Newbase60.new("464")
  end

  def test_base10_to_base60
    assert_equal     14764.to_sxg, "464"
    assert_not_equal 12345.to_sxg, "464"
  end

  def test_base10_to_base60_with_leading_zeroes
    assert_equal     14764.to_sxgf(9), "000000464"
    assert_not_equal 12345.to_sxgf(9), "000000464"
  end
end
