require 'printer'
Dir[File.dirname(__FILE__) + '/*.rb'].each{|f| require f}

require 'math/bch'

module QR

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
