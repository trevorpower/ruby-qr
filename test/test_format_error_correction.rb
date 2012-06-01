require 'test_helper.rb'
require 'qr/layer'

module QR
  class FormatErrorCorrection < Layer

  end
end

class TestFormatErrorCorrection < MiniTest::Unit::TestCase

  def setup
    @default = DefaultLayer.new
  end

  #def test_that_format_is_not_zeros
  #  @layer = QR::FormatErrorCorrection.new @default, nil
  #  assert_equal '', @layer.format_to_s  
  #end
end
