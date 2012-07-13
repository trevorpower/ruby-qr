require 'test_helper'
require 'qr/format_mask'

class TestFormatMask < MiniTest::Unit::TestCase

  def setup
    extend QR::FormatMask
  end

  def format
    @default
  end

  def test_that_format_is_masked
    @default = '001010011011100'
    assert_equal '100000011001110', format
  end

end
