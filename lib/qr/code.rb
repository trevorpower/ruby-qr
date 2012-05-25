require 'printer'
require 'qr/layer'
require 'qr/empty'
require 'qr/mask'
require 'qr/size'
require 'qr/mode'

module QR
  class Code
    def initialize
      stack do
        add :Empty
        add :Size, 21
        add :Mode, :byte
        add :Mask
        add :Timing
        add :Position
        add :QuietZone, 4
        add :Invert
      end
    end

    def stack(&modules)
      instance_eval &modules
    end

    def add(name, options = nil)
      @stack = QR.const_get(name).new @stack, options
    end

    def bits
      n = @stack.max + 1
      arr = []
      i = n * (n - 1) + 1
      while i > 0
        arr[i] = bit? n, i
        arr[i - 1] = bit? n, i - 1
        i = i - 2
      end
      arr 
    end

    def bit? n, i
      @stack.module?(i % n, i / n)
    end

    def max
      @stack.max
    end
  end
end
