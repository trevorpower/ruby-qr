require 'test_helper'
require 'qr/mask'

class TestMask < MiniTest::Unit::TestCase

  def setup
    @default = DefaultLayer.new
    @mask = QR::Mask.new @default, nil
  end

  def test_that_even_rows_are_true_when_defult_is_false
    assert_equal true, @mask.module?(0, 0)
    assert_equal true, @mask.module?(0, 2)
    assert_equal true, @mask.module?(13, 4)
  end

  def test_that_even_rows_are_false_when_defult_is_true
    @default.module = true
    assert_equal false, @mask.module?(0, 0)
    assert_equal false, @mask.module?(0, 2)
    assert_equal false, @mask.module?(13, 4)
  end

  def test_that_odd_rows_are_true_when_defult_is_false
    assert_equal false, @mask.module?(0, 1)
    assert_equal false, @mask.module?(0, 3)
    assert_equal false, @mask.module?(13, 5)
  end

  def test_that_even_rows_are_true_when_defult_is_true
    @default.module = true
    assert_equal true, @mask.module?(0, 1)
    assert_equal true, @mask.module?(0, 3)
    assert_equal true, @mask.module?(13, 5)
  end
end
