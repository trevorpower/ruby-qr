require 'test_helper'

module Enumerable
  def to_bits
    map{|i| i.to_s 2}
      .map{|i| i.rjust 8, ?0}
      .join
  end 
end

class String
  def to_poly
    scan(%r/......../)
      .map{|i| i.to_i(2)}
  end 
end

def error_code data

  gf = (0..255).map do |i|
    if i == 0
      1
    else 
      result = 2 
      (1...i).each do
        result *= 2
        if result > 255
          result = result ^ 285
        end
      end
      result
    end
  end

  poly = data.to_poly.map{|i| gf.index i}
  (0..9).each{ poly << nil }

  gen = [0, 251, 67, 46, 61, 118, 70, 64, 94, 32, 45]

  while poly.size >= gen.size
    result = poly.first - gen.first
    poly = poly
      .zip(gen.map{|i| (i + result) % 255})
      .map { |a,b|
        if a.nil?
          if b.nil?
            nil
          else
            gf[b]
          end
        elsif b.nil?
          gf[a]
        else
          gf[a] ^ gf[b]
        end
      }
      .map{|i| gf.index i}
      .drop(1)
  end
  poly.map{|i| gf[i]}.to_bits
end

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
    assert_equal error, error_code(data)
  end
end
