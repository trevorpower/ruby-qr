Ruby QR
=======

QR barcode generation in Ruby. 

## Not to be used, Programming exercise

This is just the result of me trying to learn more about QR codes and improve my Ruby skills. It is not intended to be used in any way.

## How to Use, If you Must

    ruby -Ilib qr.rb 'Hello World!'

Sample output when run from a terminal:

![Sample](http://github.com/trevorpower/ruby-qr/raw/master/sample.png)

## Algorithm Composition
I have experimented with different ways of composing the parts of the algorithm out of simpler modules.

The current method extends the instance of a QR code object with each of the different modules involved. Each module can affect the final code by implementing one of the following methods:
 * dark?
 * max
 * data
 * format
 * data_column?

### dark? x, y, max
Returns true if the module at position x,y should be dark.

### max
The maximum horizontal or vertical index for a module in the code.

### data
Provides the actual content of the code including padding and error correction bits.

### format
The `format` function returns the format bits to be used in the final code. The format indicates which error correction level is used for the data as well as what mask is applied to the data. This function is thus overriden by all error correction modules and mask modules.

The format bits themselves have error correction and a mask applied, it is therefore overriden by the `FormatMask` and `FormatErrorCorrection` modules. 

### data_column?
This function is used to determine if the column contains any content/data bits. This is only implemented by the `Timing` module, where the vertical timing column does not contain any data modules.