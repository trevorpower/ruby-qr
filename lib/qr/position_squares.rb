module QR::PositionSquares
  def dark? x, y, max
    transforms = [[x, y], [max - x, y], [x, max - y]]

    transforms.select! do |x, y|
      x < 8 && y < 8
    end

    if transforms.empty?
      super
    else
      x, y = transforms.first 
      return false if x == 7 || y == 7
      return true if x == 0 || x == 6
      return true if y == 0 || y == 6
      x != 1 && y != 1 && x != 5 && y != 5
    end
  end
end

