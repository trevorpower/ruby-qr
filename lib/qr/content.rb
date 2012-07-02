require 'qr/layer'

module QR
  class Content < Layer
    def initialize n, c, o
      @content = o
      super n, c, o
    end

    def configure config
      config[:data] = @content.each_byte.map {|b|
        b.to_s(2).rjust(8, '0')
      }.join
    end
  end
end
