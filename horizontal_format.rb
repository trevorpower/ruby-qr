  module HorizontalFormat
    def module? x, y, max, config
      if y != 8
        super
      elsif x < 7
        config[:format][x] == '1'
      elsif x == 7
        config[:format][6] == '1'
      elsif max - x < 8
        config[:format][x - max + 14] == '1'
      else
        super
      end
    end
  end

