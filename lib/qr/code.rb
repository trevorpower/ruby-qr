require 'printer'
Dir[File.dirname(__FILE__) + '/*.rb'].each{|f| require f}

require 'math/bch'

module QR

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

    def contains_data? col
      col != 6 
    end

    def bits
      n = max + 1
      arr = []
      col = n
      rows = n.downto(0).to_a
      while col > 0 
        if contains_data? col
          rows.each do |row|
            arr[row * n + col] = module? col, row, max
            arr[row * n + col - 1] = module? col -1, row, max
          end
          col -= 2
          rows.reverse!
        else
          rows.each do |row|
            arr[row * n + col] = module? col, row, max
          end
          col -= 1
        end
      end
      [arr, n]
    end

  end
end
