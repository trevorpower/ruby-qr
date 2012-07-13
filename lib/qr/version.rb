module QR

  module Version
    
    attr_accessor :max, :data_words

    VERSION_DETAILS = [
      [20, 19],
      [24, 34]  
    ]

    def version number
      @max, @data_words = VERSION_DETAILS[number - 1]
    end

  end

end
