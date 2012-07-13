module QR

  Versions = []

  def self.version version, words

    Versions << Module.new do
      module_eval %Q"

        def max
          #{version * 4 + 16}
        end

        def max_words
          #{words}
        end
      "
    end

  end

  version 1, 24
  version 2, 44
  version 3, 70
  version 4, 100
  version 5, 134

end
