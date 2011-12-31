require 'minitest/autorun'
require 'new_base_60'

class TestCase < MiniTest::Spec
  def test_base60_to_base10
    assert NewBase60.new("464").to_i == 14764
    refute NewBase60.new("464").to_i == 12345
  end

  def test_base60_to_date
    assert NewBase60.new("").to_date == Date.parse("1970/01/01")
    assert NewBase60.new("4JG").to_date == Date.parse("2012/06/05")
    assert NewBase60.new("464").to_date == Date.parse("2010/06/04")
    refute NewBase60.new("464").to_date == Date.parse("2010/06/05")
  end

  def test_date_to_base60
    assert Date.parse("2010/06/04").to_sxg == NewBase60.new("464").to_s
    refute Date.parse("2010/06/05").to_sxg == NewBase60.new("464")
  end

  def test_base10_to_base60
    assert 14764.to_sxg == "464"
    refute 12345.to_sxg == "464"
  end

  def test_base10_to_base60_with_leading_zeroes
    assert 14764.to_sxgf(1) == "464"
    assert 14764.to_sxgf(5) == "00464"
    assert 14764.to_sxgf()  == "464"
    assert 14764.to_sxgf(9) == "000000464"
    refute 12345.to_sxgf(9) == "000000464"
  end
end
