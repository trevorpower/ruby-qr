module QR
  class Empty < Layer
    def module?(x, y)
      false
    end
    def format? i
      true
    end
    def max
      0
    end
  end
end

