class Printer
  def self.printBits(bitmap, size)
    i = size
    while i < bitmap.size do
      printPair(bitmap[i - size], bitmap[i])
      i += 1
      if (i % size == 0)
        i += size
        print "\n"
      else
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
