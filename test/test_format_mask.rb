require 'test_helper'
require 'qr/format_mask'

class TestFormatMask < MiniTest::Unit::TestCase
  def setup
    @default = DefaultLayer.new
    @layer = QR::FormatMask.new @default, nil
  end

  def test_that_format_is_masked
    @default.format = '001010011011100'
    assert_equal '100000011001110', @layer.format
  end
end
