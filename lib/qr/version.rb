module QR

  class Version
    
    attr_accessor :max, :data_words

    def initialize max, data_words
      @max = max
      @data_words = data_words
    end

    All = [
      Version.new(20, 19),
      Version.new(23, 34),
      Version.new(27, 55),
      Version.new(31, 80), 
      Version.new(35, 108), 
      Version.new(39, 136)
    ] 

    def self.all
      All
    end
  end

end
