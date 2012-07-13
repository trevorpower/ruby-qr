module QR
  module Mode

    module Byte
      def data
        '0100' + super
      end
    end

  end
end
