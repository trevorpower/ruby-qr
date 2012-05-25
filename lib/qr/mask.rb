module QR
  class Mask < Layer
    def module?(x, y)
      return !@next.module?(x, y) if y % 2 == 0
      super x, y
    end
  end
end
