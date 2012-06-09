require 'printer'
require 'qr/layer'
require 'qr/remainder'
require 'qr/mask'
require 'qr/size'
require 'qr/timing'
require 'qr/length'
require 'qr/mode'
require 'qr/format_error_correction'
require 'qr/format_mask'
require 'qr/vertical_format'
require 'qr/horizontal_format'
require 'qr/error_correction'
require 'qr/data'
require 'qr/content'
require 'qr/end'
require 'qr/padding'

module QR
  class Store < Layer
    def data
      @data = super if @data.nil?
      @data
    end
  end
  class Code
    def initialize
      stack do
        add :Remainder
        add :Size, 21
        add :Content, 'hello world'
        add :Length
        add :Mode, :byte
        add :End
        add :Padding
        add :ErrorCorrection, :L 
        add :Store
        add :Data
        add :Mask
        add :FormatErrorCorrection
        add :FormatMask
        add :VerticalFormat 
        add :HorizontalFormat 
        add :Timing
        add :Position
        add :QuietZone, 3
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
      col = n
      while col > 0 
        n.downto(0).each do |row|
          arr[row * n + col] = @stack.module? col, row
          arr[row * n + col - 1] = @stack.module? col -1, row
        end
        break if col == 1
        col -= 2
        if col == 6
          n.downto(0).each do |row|
            arr[row * n + col] = @stack.module? col, row
          end
          col -= 1
        end
        0.upto(n).each do |row|
          arr[row * n + col] = @stack.module? col, row
          arr[row * n + col - 1] = @stack.module? col -1, row
        end
        col -= 2
      end
      arr 
    end

    def max
      @stack.max
    end
  end
end
