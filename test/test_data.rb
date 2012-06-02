require 'test_helper'
require 'qr/data'

class TestData < MiniTest::Unit::TestCase
  def setup
    @default = DefaultLayer.new
    @layer = QR::Data.new @default, nil
  end

  def test_that
    assert_equal '', @layer.data
  end
end
