Dir[File.dirname(__FILE__) + '/*.rb'].each{|f| require f}

module QR

  class Code 

    attr_accessor :quiet_zone_gap

    def initialize(content, invert = false)
      @content = content
      @mode = :byte
      @level = :L
      @quiet_zone_gap = 3

      extend Remainder
      extend Versions.first

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

      extend Invert if invert
    end

    def bits
      n = max + 1
      arr = []
      each_module(n) do |row, col|
        arr[row * n + col] = dark? col, row, max
      end
      [arr, n]
    end

    # Visit each module in the code in a certain order that
    # allows for the data bits to be find there correct
    # position.
    def each_module size
      col = size
      rows = size.downto(0).to_a
      while col > 0 
        if data_column? col
          rows.each do |row|
            yield row, col
            yield row, col - 1
          end
          col -= 2
          rows.reverse!
        else
          rows.each do |row|
            yield row, col
          end
          col -= 1
        end
      end
    end

  end
end
