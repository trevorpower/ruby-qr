require 'minitest/autorun'
require 'qr/layer'

class QR::Layer
  def format_from_s
    (0..14).map{|i| format?(i)? ?# : ?.}.reverse.join
  end
  def format_to_s
    (0..14).map{|i| format?(i)? ?# : ?.}.reverse.join
  end
end

class DefaultLayer < QR::Layer
  attr_accessor :format
  def initialize
    super nil, nil
  end
  def format? i
    format
  end
end

