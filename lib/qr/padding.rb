module QR
  module Padding

    def data
      super.ljust 8 * version.data_words, '1110110000010001'
    end

  end
end
