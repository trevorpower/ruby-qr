require 'test_helper'
require 'math/polynomial'

class TestPolynomialDivision < MiniTest::Unit::TestCase

  def one
    [1]
  end

  def two
    [2]
  end

  def x
    [1, 0]
  end

  def x_squared
    [1, 0, 0]
  end

  def x_plus_one
    [1, 1]
  end

  def x_minus_one
    [1, -1]
  end

  def test_that_x_squared_divided_by_x_is_one
    assert_equal [one, []], Math::Polynomial.div(x_squared, x)
  end

  def test_that_x_divided_by_x_is_one
    assert_equal [one, []], Math::Polynomial.div(x, x)
  end

  def test_that_x_divided_by_one_is_x
    assert_equal [x, []], Math::Polynomial.div(x, one)
  end

  def test_that_x_squared_divided_by_one_is_x_squared
    assert_equal [x_squared, []], Math::Polynomial.div(x_squared, one)
  end

  def test_that_x_squared_divided_by_x_is_one
    assert_equal [x, []], Math::Polynomial.div(x_squared, x)
  end

  def test_that_x_squared_divided_by_x_is_x
    assert_equal [x, []], Math::Polynomial.div(x_squared, x)
  end

  def test_that_x_plus_one_divided_by_one_is_x_plus_one
    assert_equal [x_plus_one, []], Math::Polynomial.div(x_plus_one, one)
  end

  def test_that_x_plus_one_divided_by_x_is_x_with_one_remaining
    assert_equal [one, one], Math::Polynomial.div(x_plus_one, x)
  end

  def test_that_x_squared_divided_by_x_plus_one_is_x_mins_one_with_one_remaining
    assert_equal [x_minus_one, one], Math::Polynomial.div(x_squared, x_plus_one)
  end

end
