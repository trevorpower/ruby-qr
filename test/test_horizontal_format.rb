require 'test_helper.rb'
require 'qr/horizontal_format'

class TestHorizontalFormat < MiniTest::Unit::TestCase

  def setup
    @default = DefaultLayer.new
    @layer = QR::HorizontalFormat.new(@default, nil)
  end

  def test_that_first_five_bits_on_row_eight_correspond_to_first_five_bits_of_format
    @default.format = "010010"
    assert_equal false, @layer.module?(0, 8)
    assert_equal true, @layer.module?(1, 8)
    assert_equal false, @layer.module?(2, 8)
    assert_equal false, @layer.module?(3, 8)
    assert_equal true, @layer.module?(4, 8)
    assert_equal false, @layer.module?(5, 8)
  end

  def test_that_module_seven_on_row_eight_is_true_when_bit_six_is_one
    @default.format = "0000001"
    assert_equal true, @layer.module?(7, 8)
  end

  def test_that_module_seven_on_row_eight_is_false_when_bit_six_is_one
    @default.format = "0000000"
    assert_equal false, @layer.module?(7, 8)
  end

  def test_that_first_five_bits_on_row_eight_correspond_to_first_five_bits_of_format
                      #01234567890123456
    @default.format = "00000000000101101"
    @default.max = 39
    assert_equal true, @layer.module?(34, 8)
    assert_equal false, @layer.module?(35, 8)
    assert_equal true, @layer.module?(36, 8)
    assert_equal true, @layer.module?(37, 8)
    assert_equal false, @layer.module?(38, 8)
    assert_equal true, @layer.module?(39, 8)
  end
end
