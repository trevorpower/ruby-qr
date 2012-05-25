module QR
  class Empty < Layer
    def module?(x, y)
      false
    end
    def max
      0
    end
  end
end

