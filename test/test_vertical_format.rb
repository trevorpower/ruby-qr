require 'test_helper.rb'
require 'qr/vertical_format'

class TestVerticalFormat < MiniTest::Unit::TestCase

  def setup
    @default = DefaultLayer.new
    @layer = QR::VerticalFormat.new(@default, nil)
  end

  def test_that_bottom_five_bits_on_column_eight_correspond_to_first_five_bits_of_format
    @default.format = "010010"
    @default.max = 50
    assert_equal false, @layer.module?(8, 45)
    assert_equal true,  @layer.module?(8, 46)
    assert_equal false, @layer.module?(8, 47)
    assert_equal false, @layer.module?(8, 48)
    assert_equal true,  @layer.module?(8, 49)
    assert_equal false, @layer.module?(8, 50)
  end

  def test_that_module_seven_from_the_bottom_is_true
    @default.format = "000000000000000"
    @default.max = 28
    assert_equal true, @layer.module?(8, 21)
  end

  def test_that_first_six_bits_on_column_eight_correspond_to_first_six_bits_of_format
                      #012345678901234
    @default.format = "101111000000000"
    @default.max = 39
    assert_equal true,  @layer.module?(8, 35)
    assert_equal true,  @layer.module?(8, 36)
    assert_equal true,  @layer.module?(8, 37)
    assert_equal false, @layer.module?(8, 38)
    assert_equal true,  @layer.module?(8, 39)
  end
end
