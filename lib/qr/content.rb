require 'qr/layer'

module QR
  class Content < Layer
    def initialize n, o
      super n, o
      @content = o
    end

    def data
      @content.each_byte.map {|b|
        b.to_s(2).rjust(8, '0')
      }.join
    end
  end
end
