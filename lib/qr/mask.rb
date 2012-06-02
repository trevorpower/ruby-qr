module QR
  class Mask < Layer

    def format
      super + "001"
    end

    def module?(x, y)
      super(x, y) ^ (y % 2 == 0)
    end

  end
end
