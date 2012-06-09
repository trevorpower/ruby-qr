require 'test_helper'
require 'qr/error_correction'

class TestErrorCorrection < MiniTest::Unit::TestCase

  def data
    '00010000' '00100000' \
    '00001100' '01010110' \
    '01100001' '10000000' \
    '11101100' '00010001' \
    '11101100' '00010001' \
    '11101100' '00010001' \
    '11101100' '00010001' \
    '11101100' '00010001' 
  end

  def error
    '10100101' '00100100' \
    '11010100' '11000001' \
    '11101101' '00110110' \
    '11000111' '10000111' \
    '00101100' '01010101' 
  end

  def test_that
    assert_equal error, QR::ErrorCorrection.error_code(data)
  end
end
