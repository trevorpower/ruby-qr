require 'qr/code'
require 'printer'



Printer.printBits *QR::Code.new(ARGV.first).bits
