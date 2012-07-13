require 'test_helper.rb'
require 'qr/horizontal_format'

class TestHorizontalFormat < MiniTest::Unit::TestCase

  attr_accessor :max

  def setup
    extend QR::HorizontalFormat
  end

  def format
    @default
  end

  def dark? x, y, max
    false
  end

  def test_that_first_five_bits_on_row_eight_correspond_to_first_five_bits_of_format
    @default = "010010"
    assert_equal false, dark?(0, 8, 21)
    assert_equal true, dark?(1, 8, 21)
    assert_equal false, dark?(2, 8, 21)
    assert_equal false, dark?(3, 8, 21)
    assert_equal true, dark?(4, 8, 21)
    assert_equal false, dark?(5, 8, 21)
  end

  def test_that_module_seven_on_row_eight_is_true_when_bit_six_is_one
    @default = "0000001"
    assert_equal true, dark?(7, 8, 21)
  end

  def test_that_module_seven_on_row_eight_is_false_when_bit_six_is_one
    @default = "0000000"
    assert_equal false, dark?(7, 8, 21)
  end

  def test_that_last_six_bits_on_row_eight_correspond_to_first_six_bits_of_format
               #012345678901234
    @default = "000000000001001"
    assert_equal false, dark?(34, 8, 39)
    assert_equal false, dark?(35, 8, 39)
    assert_equal true, dark?(36, 8, 39)
    assert_equal false, dark?(37, 8, 39)
    assert_equal false, dark?(38, 8, 39)
    assert_equal true, dark?(39, 8, 39)
  end
end
