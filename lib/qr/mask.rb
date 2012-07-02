module QR
  class Mask < Layer

    def initialize lower_level, config
      config[:format] = config[:format] + "001"
      super lower_level, config
    end

    def module?(x, y, config)
      super(x, y, config) ^ (y % 2 == 0)
    end

  end
end
