require 'minitest/autorun'
require 'qr/layer'

class DefaultLayer < QR::Layer

  attr_accessor :format, :max

  def initialize
    super nil, nil
  end

  def module? x, y
    false
  end
end

