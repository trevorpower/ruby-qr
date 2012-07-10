Ruby QR
=======

QR barcode generation in Ruby. (not to be used, programming exercise)

This is just the result of me trying to learn more about QR codes and improve my Ruby skills. It is not intended to be used in any way.

I have experimented with differnt ways of composing code out of simple modules.

The current method used is extend the instance of the QR code object with wach og the differnet modules involved. Each module can affect the final code by implementing one of the following methods.
 * module? x, y, max
 * size
 * data
 * format
 * data_column?

    ███████████████████████████    
    ███▀▀▀▀▀▀▀█▀▀████▀▀▀▀▀▀▀███    
    ███ █▀▀▀█ █▄ ▀ ██ █▀▀▀█ ███    
    ███ █   █ █▀▀ ▀██ █   █ ███    
    ███ ▀▀▀▀▀ █ █▀▄▀█ ▀▀▀▀▀ ███    
    ███▀▀▀██▀▀█ ▄█▄▀▀▀▀▀██▀▀███    
    ███▀█ ▀▀█▀█ █▀▄ ▄▄█ ▄▀█ ███  
    ███▄▀▀█▀▀▀▀ ▄█▀ ▄█▄  █▀████    
    ███▀▀▀▀▀▀▀█▄▀█▄ ▀█▄▀  █▀███    
    ███ █▀▀▀█ █▄▀█▀▀ █▀▀ ██████    
    ███ █   █ █▀ ▄▀   ▀    ▀███    
    ███ ▀▀▀▀▀ █ ▄██▀ █▄▄ ██▀███    
    ███████████████████████████    
    ███████████████████████████    
    
x
