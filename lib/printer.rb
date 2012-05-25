class Printer
  def self.printBits(bitmap, width)
    i = width
    while i < bitmap.size do
      printPair(bitmap[i - width], bitmap[i])
      i += 1
      if (i % width == 0)
        i += width
        print "\n"
      end
    end
  end

  def self.printPair(upper, lower)
    if upper
      print lower ? "\u2588" : "\u2580"
    else
      print lower ? "\u2584" : " "
    end
  end
end
