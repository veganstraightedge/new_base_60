require "test/unit"
require "newbase60"
require "date"

class TestNewbase60 < Test::Unit::TestCase
  def test_base60_to_base10
    assert_equal     Newbase60.new("464").to_i, 14764
    assert_not_equal Newbase60.new("464").to_i, 12345
  end

  def test_base60_to_time
  end

  def test_time_to_base60
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
