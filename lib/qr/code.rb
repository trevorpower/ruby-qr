require 'printer'
require 'qr/layer'
require 'qr/remainder'
require 'qr/mask'
require 'qr/size'
require 'qr/mode'
require 'qr/format_error_correction'
require 'qr/format_mask'
require 'qr/vertical_format'
require 'qr/horizontal_format'
require 'qr/error_correction'

module QR
  class Code
    def initialize
      stack do
        add :Remainder
        add :Size, 21
        add :Mode, :byte
        add :ErrorCorrection, :L 
        add :Mask
        add :FormatErrorCorrection
        add :FormatMask
        add :VerticalFormat 
        add :HorizontalFormat 
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
      c = n
      while c > 0 
        n.downto(0).each do |r|
          arr[r * n + c] = bit? n, r * n + c
          arr[r * n + c - 1] = bit? n, r * n + c - 1
        end
        c -= 2
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
