require 'printer'
Dir[File.dirname(__FILE__) + '/*.rb'].each{|f| require f}

require 'math/bch'

module QR

  module Timing
    def module? x, y, *a
      return y % 2 == 0 if x == 6
      return x % 2 == 0 if y == 6
      super
    end
  end

  module PositionSquares
    def module? x, y, max
      transforms = [[x, y], [max - x, y], [x, max - y]]
      transforms.select! do |x, y|
        x < 8 && y < 8
      end
      if transforms.empty?
        super
      else
        x, y = transforms.first 
        return false if x == 7 || y == 7
        return true if x == 0 || x == 6
        return true if y == 0 || y == 6
        x != 1 && y != 1 && x != 5 && y != 5
      end
    end
  end

  module QuietZone
    def max
      super + quiet_zone_gap * 2
    end

    def module? x, y, max
      x >= quiet_zone_gap &&
      x <= max - quiet_zone_gap &&
      y >= quiet_zone_gap && 
      y <= max - quiet_zone_gap && 
      super(x - quiet_zone_gap, y - quiet_zone_gap, max - quiet_zone_gap * 2)
    end
  end

  module Invert
    def module? *a
      !super
    end
  end

  class Code 

    attr_accessor :quiet_zone_gap

    def initialize(content)

      @content = content
      @mode = :byte
      @level = :L
      @quiet_zone_gap = 3

      extend Remainder
      extend Size # should be different for each version

      extend Content
      extend Length
      extend Mode
      extend End

      extend Padding
      extend ErrorCorrection

      extend Data
      extend Mask

      extend FormatErrorCorrection
      extend FormatMask

      extend VerticalFormat
      extend HorizontalFormat
      extend Timing
      extend PositionSquares
      extend QuietZone
      extend Invert
    end

    def bits
      n = max + 1
      arr = []
      col = n
      while col > 0 
        n.downto(0).each do |row|
          arr[row * n + col] = module? col, row, max
          arr[row * n + col - 1] = module? col -1, row, max
        end
        break if col == 1
        col -= 2
        if col == 6
          n.downto(0).each do |row|
            arr[row * n + col] = module? col, row, max
          end
          col -= 1
        end
        0.upto(n).each do |row|
          arr[row * n + col] = module? col, row, max
          arr[row * n + col - 1] = module?  col -1, row, max
        end
        col -= 2
      end
      [arr, n]
    end

  end
end
