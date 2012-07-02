module QR
  class Layer

    def initialize(lower_layer)
      @lower_layer = lower_layer
    end 

    def module? *args
      @lower_layer.module? *args
    end

  end
end
