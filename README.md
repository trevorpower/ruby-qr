Ruby QR
=======

QR barcode generation in Ruby. __(not to be used, programming exercise)__

This is just the result of me trying to learn more about QR codes and improve my Ruby skills. It is not intended to be used in any way.

I have experimented with differnt ways of composing code out of simple modules.

The current method used is extend the instance of the QR code object with wach og the differnet modules involved. Each module can affect the final code by implementing one of the following methods.
 * module? x, y, max
 * size
 * data
 * format
 * data_column?

Sample output when run from a terminal:

![Sample](http://github.com/trevorpower/ruby-qr/raw/master/sample.png)

### format
The `format` function returns the format bits to be used in the final code. The format indicates which error correction level is used for the data as well as what mask is applied to the data. This function is thus overriden by all error correction modules and mask modules.

The format bit themselves have error correction and a mask applied, it is therefore overriden by the `FormatMask` and and `FormatErrorCorrection` modules. 