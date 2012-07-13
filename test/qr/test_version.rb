require 'minitest/autorun'
require 'qr/version'

class TestVersion < MiniTest::Unit::TestCase
  include QR::Version

  def test_that_version_one_seven_data_words
    version 1
    assert_equal 20, max
    assert_equal 19, data_words
  end

end
