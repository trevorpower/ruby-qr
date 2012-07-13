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

  def module? x, y, max
    false
  end

  def test_that_first_five_bits_on_row_eight_correspond_to_first_five_bits_of_format
    @default = "010010"
    assert_equal false, module?(0, 8, 21)
    assert_equal true, module?(1, 8, 21)
    assert_equal false, module?(2, 8, 21)
    assert_equal false, module?(3, 8, 21)
    assert_equal true, module?(4, 8, 21)
    assert_equal false, module?(5, 8, 21)
  end

  def test_that_module_seven_on_row_eight_is_true_when_bit_six_is_one
    @default = "0000001"
    assert_equal true, module?(7, 8, 21)
  end

  def test_that_module_seven_on_row_eight_is_false_when_bit_six_is_one
    @default = "0000000"
    assert_equal false, module?(7, 8, 21)
  end

  def test_that_last_six_bits_on_row_eight_correspond_to_first_six_bits_of_format
               #012345678901234
    @default = "000000000001001"
    assert_equal false, module?(34, 8, 39)
    assert_equal false, module?(35, 8, 39)
    assert_equal true, module?(36, 8, 39)
    assert_equal false, module?(37, 8, 39)
    assert_equal false, module?(38, 8, 39)
    assert_equal true, module?(39, 8, 39)
  end
end
