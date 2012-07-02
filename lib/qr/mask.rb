module QR
  class Mask < Layer

    def initialize lower_level, config
      config[:format] = config[:format] + "001"
      super lower_level
    end

    def module?(x, y, max, config)
      super(x, y, max, config) ^ (y % 2 == 0)
    end

  end
end
