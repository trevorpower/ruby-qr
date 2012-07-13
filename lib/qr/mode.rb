module QR
  module Mode

    module Byte

      def data
        '0100' + super
      end

      def word_size
        8
      end

    end

  end
end
