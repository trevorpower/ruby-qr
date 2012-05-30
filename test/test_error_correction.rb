require 'minitest/autorun'
require 'qr/error_correction'

  class QR::Layer
    def format_from_s
      (0..14).map{|i| format?(i)? ?# : ?.}.reverse.join
    end
    def format_to_s
      (0..14).map{|i| format?(i)? ?# : ?.}.reverse.join
    end
  end

class TestErrorCorrection < MiniTest::Unit::TestCase
  class DefaultLayer < QR::Layer
    attr_accessor :format
    def initialize
      super nil, nil
    end
    def format? i
      format
    end
  end

  def setup
    @default = DefaultLayer.new
  end

  def test_that_first_to_bits_are_set_fot_L_when_default_is_off
    @layer = QR::ErrorCorrection.new @default, :L
    @default.format = false
    assert_equal '.#.............', @layer.format_to_s
  end

  def test_that_all_bits_are_set_for_L_when_default_is_on
    @layer = QR::ErrorCorrection.new @default, :L
    @default.format = true
    assert_equal '.##############', @layer.format_to_s
  end

  def test_that_first_to_bits_are_set_fot_H_when_default_is_off
    @layer = QR::ErrorCorrection.new @default, :H
    @default.format = false
    assert_equal '#..............', @layer.format_to_s
  end
end

