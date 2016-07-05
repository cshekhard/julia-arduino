using SerialPorts
using ArduinoTools

ser = connectBoard(115200)
pinMode(ser,9,"OUTPUT")
pinMode(ser,11,"OUTPUT")
digiWrite(ser,9,1)
digiWrite(ser,11,1)
sleep(5)
digiWrite(ser,9,0)
sleep(3)
digiWrite(ser,11,0)
close(ser)
