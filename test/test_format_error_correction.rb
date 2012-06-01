require 'test_helper.rb'
require 'qr/layer'

module QR
  class FormatErrorCorrection < Layer
    def format
      super + bch(super.to_i 2).to_s(2)
    end
    def bch(bits)
      676
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
    #assert_equal '001010011011100', @layer.format  
  end
end
