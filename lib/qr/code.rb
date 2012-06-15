require 'printer'
Dir[File.dirname(__FILE__) + '/*.rb'].each{|f| require f}

module QR

  class Store < Layer
    def data
      @data = super if @data.nil?
      @data
    end
  end

  class Code
    def initialize(content)
      add :Remainder
      add :Size, 21
      add :Content, content
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
      [arr, n]
    end

    def max
      @stack.max
    end
    
    def size
      max + 1
    end

  end
end
