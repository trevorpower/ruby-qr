require 'qr/code'

qr = QR::Code.new

Printer.printBits qr.bits, qr.size
