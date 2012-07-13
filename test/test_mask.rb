require 'test_helper'
require 'qr/mask'

class TestMask < MiniTest::Unit::TestCase

  def setup
    extend QR::Mask
  end

  def module? x, y, z
    @default
  end

  def test_that_even_rows_are_true_when_defult_is_false
    assert_equal true, module?(0, 0, 21)
    assert_equal true, module?(0, 2, 21)
    assert_equal true, module?(13, 4, 21)
  end

  def test_that_even_rows_are_false_when_defult_is_true
    @default = true
    assert_equal false, module?(0, 0, 21)
    assert_equal false, module?(0, 2, 21)
    assert_equal false, module?(13, 4, 21)
  end

  def test_that_odd_rows_are_true_when_defult_is_false
    assert_equal false, module?(0, 1, 21)
    assert_equal false, module?(0, 3, 21)
    assert_equal false, module?(13, 5, 21)
  end

  def test_that_even_rows_are_true_when_defult_is_true
    @default = true
    assert_equal true, module?(0, 1, 21)
    assert_equal true, module?(0, 3, 21)
    assert_equal true, module?(13, 5, 21)
  end
end
