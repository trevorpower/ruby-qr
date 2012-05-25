class Printer
  def self.printBits(bitmap, size)
     (1..size + 1).step(2).each do |y|
      (0..size).each do |x|
        upperModule = !bitmap[[x,y-1]]
        lowerModule = !bitmap[[x,y]]
        if upperModule 
          print lowerModule ? "\u2588" : "\u2580"
        else
          print lowerModule ? "\u2584" : " "
        end
      end
       print "\n"
     end
  end
end
