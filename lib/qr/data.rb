require 'qr/layer'

module QR
  module Data
    def module?(x, y, max, config)
      @index = -1 if @index.nil?
      @index += 1 
      config[:data][@index] == '1'
    end
  end
end
