require 'minitest/autorun'
require 'qr/layer'

class DefaultLayer < QR::Layer

  attr_accessor :format, :max, :module

  def initialize
    super nil, nil
  end

  def data
    ''
  end

  def module? x, y
    @module
  end
end

