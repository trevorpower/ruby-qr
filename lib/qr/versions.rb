module QR

  Versions = (1..40).map do |version|

    Module.new do
      module_eval %Q"

        def max
          #{version * 4 + 16}
        end

      "
    end

  end

end

module QR::Size

  def max
    20
  end

end
