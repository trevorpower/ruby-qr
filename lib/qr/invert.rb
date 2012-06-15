module QR
  class Invert < Layer
    def module?(x, y)
      !super x, y
    end
  end
end

