module QR::Data
  def dark?(x, y, max)
    @index = -1 if @index.nil?
    @index += 1 
    data[@index] == '1'
  end
end
