require 'printer'
Dir[File.dirname(__FILE__) + '/*.rb'].each{|f| require f}

module QR

  module Remainder
    def module? *a
      false
    end
  end

  module Stack
    def module? *a
      @stack.module? *a
    end
  end

  module Invert
    def module? *a
      ! super
    end
  end

  class Code 

    include Remainder 
    include Stack
    include Invert 

    def initialize(content)
      @config = {}
      add :Size, 21
      add :Content, content
      add :Length
      add :Mode, :byte
      add :End
      add :Padding
      add :ErrorCorrection, :L 
      add :Data
      add :Mask
      add :FormatErrorCorrection
      add :FormatMask
      add :VerticalFormat 
      add :HorizontalFormat 
      add :Timing
      add :Position
      add :QuietZone, 3
    end

    def add(name, *options)
      @stack = QR.const_get(name).new @stack, @config, *options
    end

    def bits
      is_dark = @config[:module?]
      puts @config.inspect
      max = @config[:max]
      n = max + 1
      arr = []
      col = n
      while col > 0 
        n.downto(0).each do |row|
          arr[row * n + col] = module?(col, row, max, @config)
          arr[row * n + col - 1] = module?(col -1, row, max,  @config)
        end
        break if col == 1
        col -= 2
        if col == 6
          n.downto(0).each do |row|
            arr[row * n + col] = module? col, row, max, @config
          end
          col -= 1
        end
        0.upto(n).each do |row|
          arr[row * n + col] = module? col, row, max, @config
          arr[row * n + col - 1] = module? col -1, row, max, @config
        end
        col -= 2
      end
      [arr, n]
    end

  end
end
