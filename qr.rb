require 'qr/code'
require 'printer'

invert = ARGV.include? '-i'
ARGV.delete '-i'

qr = QR::Code.new(ARGV.first, invert)
Printer.printBits *qr.bits
