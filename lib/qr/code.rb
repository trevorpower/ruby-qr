require 'printer'
Dir[File.dirname(__FILE__) + '/*.rb'].each{|f| require f}

require 'block_stack'

module QR

  module Remainder
    def module? *a
      false
    end
  end

  class Code 

    include Remainder 

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

      @is_dark = BlockStack.new
      @is_dark.push{|*a| @stack.module? *a}

      @max = BlockStack.new
      @max << proc { @config[:max] }

      vertical_format
      horizontal_format

      timing do
        is_dark? << lambda do |x, y, *a|
          return y % 2 == 0 if x == 6
          return x % 2 == 0 if y == 6
          peek!
        end
      end

      position_squares do
        is_dark? << lambda do |x, y, max, config|
          transforms = [[x, y], [max - x, y], [x, max - y]]
          transforms.select! do |x, y|
            x < 8 && y < 8
          end
          if transforms.empty?
            peek!
          else
            x, y = transforms.first 
            return false if x == 7 || y == 7
            return true if x == 0 || x == 6
            return true if y == 0 || y == 6
            x != 1 && y != 1 && x != 5 && y != 5
          end
        end
      end

      quiet_zone 3 do |gap|
        @max << proc { peek! + gap * 2 }

        is_dark? << proc do |x, y, max, config|
          x >= gap &&
          x <= max - gap &&
          y >= gap && 
          y <= max - gap && 
          peek(x - gap, y - gap, max - gap * 2, config)
        end
      end

      invert do
        is_dark? << proc { !peek! }
      end
    end

    def vertical_format
      is_dark? << proc do |x, y, max, config|
        format = config[:format]
        if x != 8
          peek!
        elsif max - y == 7
          true
        elsif y < 8
          format[14 - y] == '1'
        elsif max - y < 7
          format[max - y] == '1'
        else
          peek!
        end
      end
    end

    def horizontal_format
      is_dark? << proc do |x, y, max, config|
        if y != 8
          peek!
        elsif x < 7
          config[:format][x] == '1'
        elsif x == 7
          config[:format][6] == '1'
        elsif max - x < 8
          config[:format][x - max + 14] == '1'
        else
          peek!
        end
      end
    end

    def is_dark?
      @is_dark
    end

    def method_missing name, *args, &block
      block.call *args
    end

    def add(name, *options)
      @stack = QR.const_get(name).new @stack, @config, *options
    end

    def bits
      is_dark = @config[:module?]
      puts @config.inspect
      max = @max.peek
      n = max + 1
      arr = []
      col = n
      while col > 0 
        n.downto(0).each do |row|
          arr[row * n + col] = @is_dark.peek(col, row, max, @config)
          arr[row * n + col - 1] = @is_dark.peek(col -1, row, max,  @config)
        end
        break if col == 1
        col -= 2
        if col == 6
          n.downto(0).each do |row|
            arr[row * n + col] = @is_dark.peek col, row, max, @config
          end
          col -= 1
        end
        0.upto(n).each do |row|
          arr[row * n + col] = @is_dark.peek col, row, max, @config
          arr[row * n + col - 1] = @is_dark.peek  col -1, row, max, @config
        end
        col -= 2
      end
      [arr, n]
    end

  end
end
