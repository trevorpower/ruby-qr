require 'qr/code'

Printer.printBits *QR::Code.new(ARGV.first).bits
