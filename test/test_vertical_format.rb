require 'test_helper.rb'
require 'qr/vertical_format'

class TestVerticalFormat < MiniTest::Unit::TestCase

  def setup
    extend QR::VerticalFormat
  end

  def format
    @default
  end

  def test_that_bottom_five_bits_on_column_eight_correspond_to_first_five_bits_of_format
    @default = "010010"
    assert_equal false, dark?(8, 45, 50)
    assert_equal true,  dark?(8, 46, 50)
    assert_equal false, dark?(8, 47, 50)
    assert_equal false, dark?(8, 48, 50)
    assert_equal true,  dark?(8, 49, 50)
    assert_equal false, dark?(8, 50, 50)
  end

  def test_that_module_seven_from_the_bottom_is_true
    @default = "000000000000000"
    assert_equal true, dark?(8, 21, 28)
  end

  def test_that_first_six_bits_on_column_eight_correspond_to_first_six_bits_of_format
               #012345678901234
    @default = "101111000000000"
    assert_equal true,  dark?(8, 35, 39)
    assert_equal true,  dark?(8, 36, 39)
    assert_equal true,  dark?(8, 37, 39)
    assert_equal false, dark?(8, 38, 39)
    assert_equal true,  dark?(8, 39, 39)
  end
end
