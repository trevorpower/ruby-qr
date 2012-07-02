module QR
  class Invert < Layer
    def module?(x, y, config)
      !super x, y, config
    end
  end
end

