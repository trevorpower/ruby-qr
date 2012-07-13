require 'test_helper.rb'
require 'qr/format_error_correction'

class TestFormatErrorCorrection < MiniTest::Unit::TestCase

  def setup
    extend QR::FormatErrorCorrection
  end

  def format
    @default
  end

  def test_that_format_is_not_zeros
    @default = "00101"
    assert_equal '001010011011100', format  
  end

end
