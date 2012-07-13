module QR
  module Padding

    def data
      super.ljust(word_size * 19, '1110110000010001')
    end

  end
end
