module QR
  module Length

    def data
      length(super) + super
    end

    def length(bits)
      bits.length.div(8).to_s(2).rjust(8, '0')
    end

  end
end
