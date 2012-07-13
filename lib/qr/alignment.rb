module QR
  module Alignment

    def alignment_pattern_dark? x, y
      [
        "#####", 
        "#   #", 
        "# # #", 
        "#   #", 
        "#####"
      ][x][y] == ?#
    end

    def alignments max
      a = [6]
      a << max - 6 if max > 21
      a.map{|i| (i-2..i+2)}
    end

    def dark? x, y, max

      ax = alignments(max)
        .select{|p| p.cover? x}
        .map{|p| p.max - x}
        .first

      return super if ax.nil?

      ay = alignments(max)
        .select{|p| p.cover? y}
        .map{|p| p.max - y}
        .first

      return super if ay.nil?

      alignment_pattern_dark? ax, ay
    end
  end
end
