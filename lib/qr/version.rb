module QR

  module Version
    
    attr_accessor :max, :data_words

    def version number
      @max = 20
      @data_words = 19
    end

  end

end
