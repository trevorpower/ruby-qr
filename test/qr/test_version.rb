require 'minitest/autorun'
require 'qr/version'

class TestVersion < MiniTest::Unit::TestCase
  include QR::Version

  def test_that_version_one_has_nineteen_datawords
    version 1
    assert_equal 20, max
    assert_equal 19, data_words
  end

  
  def test_that_version_two_has_thirty_four_datawords
    version 2
    assert_equal 24, max
    assert_equal 34, data_words
  end

end
