require 'test_helper.rb'
require 'qr/layer'
require 'math/polynomial'

module QR
  class FormatErrorCorrection < Layer

    def format
      super + bch(super)
    end

    def bch(bits)
      poly = bits.chars.map{|c| c.to_i}
      poly.fill 0, 5, 10
      generator = [1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 1]
      q, r = Math::Polynomial.div(poly, generator)
      r.map{|i| i*i}.join.rjust 10, "0"
    end

  end
end

class TestFormatErrorCorrection < MiniTest::Unit::TestCase

  def setup
    @default = DefaultLayer.new
    @layer = QR::FormatErrorCorrection.new @default, nil
  end

  def test_that_format_is_not_zeros
    @default.format = "00101"
    assert_equal '001010011011100', @layer.format  
  end
end
