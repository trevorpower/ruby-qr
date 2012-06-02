require 'test_helper.rb'
require 'qr/format_error_correction'

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
