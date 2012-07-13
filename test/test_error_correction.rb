require 'test_helper'
require 'qr/error_correction'

class TestErrorCorrection < MiniTest::Unit::TestCase

  def setup
    extend QR::ErrorCorrection
  end

  def test_that_first_to_bits_are_set_fot_L_when_default_is_off
    @level = :L
    assert_equal '01', format
  end

  def test_that_all_bits_are_set_for_L_when_default_is_on
    @level = :L
    assert_equal '01', format
  end

  def test_that_first_to_bits_are_set_fot_H_when_default_is_off
    @level = :H
    assert_equal '10', format
  end
end

