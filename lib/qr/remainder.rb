module QR
  class Remainder < Layer

    def initialize lower_layer, config
      super lower_layer
    end

    def module?(x, y, max, config)
      false
    end

  end
end

