require 'minitest/autorun'
require 'qr/alignment'

class TestAlignment < MiniTest::Unit::TestCase

  def setup
    extend QR::Alignment
  end

  def dark? x, y, max
    @default
  end

  def version_two_dark
    [
      [16, 16], [17, 16], [18, 16], [19, 16], [20, 16],
      [16, 17],                               [20, 17],
      [16, 18],           [18, 18],           [20, 18],
      [16, 19],                               [20, 19],
      [16, 20], [17, 20], [18, 20], [19, 20], [20, 20],
    ]
  end

  def test_that_default_value_is_returned_for_zero_zero
    @default = false
    assert_equal false, dark?(0, 0, 24)

    @default = true
    assert_equal true, dark?(0, 0, 24)
  end

  def test_that_version_two_modules_are_dark_when_default_is_false
    @default = false
    version_two_dark.each do |x, y|
      assert dark?(x, y, 24), "#{x}, #{y}"
    end
  end

  def test_that_version_two_modules_are_dark_when_default_is_false
    @default = true
    version_two_dark.each do |x, y|
      assert dark?(x, y, 24), "#{x}, #{y}"
    end
  end
end
