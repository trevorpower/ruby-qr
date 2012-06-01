require 'test_helper'
require 'qr/error_correction'

class TestErrorCorrection < MiniTest::Unit::TestCase

  def setup
    @default = DefaultLayer.new
  end

  def test_that_first_to_bits_are_set_fot_L_when_default_is_off
    @layer = QR::ErrorCorrection.new @default, :L
    assert_equal '01', @layer.format
  end

  def test_that_all_bits_are_set_for_L_when_default_is_on
    @layer = QR::ErrorCorrection.new @default, :L
    assert_equal '01', @layer.format
  end

  def test_that_first_to_bits_are_set_fot_H_when_default_is_off
    @layer = QR::ErrorCorrection.new @default, :H
    assert_equal '10', @layer.format
  end
end

