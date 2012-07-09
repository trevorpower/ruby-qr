require 'printer'
Dir[File.dirname(__FILE__) + '/*.rb'].each{|f| require f}

require 'math/bch'

module QR

  module FormatMask
    def format
      super
        .chars
        .map{|c| c.to_i}
        .zip('101010000010010'.chars.map{|c| c.to_i})
        .map{|a,b| a ^ b}
        .join
    end
  end

  module VerticalFormat
    def module? x, y, max, config
      format = config[:format]
      if x != 8
        super
      elsif max - y == 7
        true
      elsif y < 8
        format[14 - y] == '1'
      elsif max - y < 7
        format[max - y] == '1'
      else
        super
      end
    end
  end

  module HorizontalFormat
    def module? x, y, max, config
      if y != 8
        super
      elsif x < 7
        config[:format][x] == '1'
      elsif x == 7
        config[:format][6] == '1'
      elsif max - x < 8
        config[:format][x - max + 14] == '1'
      else
        super
      end
    end
  end

  module Timing
    def module? x, y, *a
      return y % 2 == 0 if x == 6
      return x % 2 == 0 if y == 6
      super
    end
  end

  module PositionSquares
    def module? x, y, max, config
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

    def module? x, y, max, config
      x >= quiet_zone_gap &&
      x <= max - quiet_zone_gap &&
      y >= quiet_zone_gap && 
      y <= max - quiet_zone_gap && 
      super(x - quiet_zone_gap, y - quiet_zone_gap, max - quiet_zone_gap * 2, config)
    end
  end

  module Invert
    def module? *a
      !super
    end
  end

  class Code 

    attr_accessor :quiet_zone_gap

    def format
      ''
    end

    def data
      ''
    end

    def initialize(content)

      @content = content
      @mode = :byte
      @level = :L
      @quiet_zone_gap = 3
      @config = {}

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
      @config[:format] = format
      @config[:data] = data
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
          arr[row * n + col - 1] = module?  col -1, row, max, @config
        end
        col -= 2
      end
      [arr, n]
    end

  end
end
