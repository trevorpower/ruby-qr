require 'printer'
require 'qr/layer'
require 'qr/empty'
require 'qr/mask'
require 'qr/size'

module QR
  class Code
    def initialize
      stack do
        layer :Empty
        layer :Size, 21
        layer :Mode
        layer :Mask
        layer :Timing
        layer :Position
        layer :QuietZone, 4
        layer :Invert
      end
    end

    def stack(&modules)
      instance_eval &modules
    end

    def layer(name, options = nil)
      @stack = QR.const_get(name).new @stack, options
    end

    def bits
      n = @stack.max + 1
      arr = []
      (0...n**2).each do |i|
          arr[i] = @stack.module?(i % n, i / n)
      end
      arr 
    end

    def max
      @stack.max
    end
  end
end
