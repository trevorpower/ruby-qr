module QR
  class Mask < Layer

    def configure config
      config[:format] = config[:format] + "001"
    end

    def module?(x, y, config)
      super(x, y, config) ^ (y % 2 == 0)
    end

  end
end
