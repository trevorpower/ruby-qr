require 'qr/code'

qr = QR::Code.new 'hello world'

Printer.printBits qr.bits, qr.size
