module QR

  class Version
    
    attr_accessor :max, :data_words

    def initialize max, data_words
      @max = max
      @data_words = data_words
    end

    All = [
      Version.new(20, 19),
      Version.new(23, 34)
    ] 

    def self.all
      All
    end
  end

end
