using SerialPorts
using ArduinoTools

ser = connectBoard(115200)
pinMode(ser,9,"OUTPUT")
digiWrite(ser,9,1)
close(ser)
