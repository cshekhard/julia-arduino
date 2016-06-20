using SerialPorts
include("ArduinoTools.jl")

ser = connectBoard(115200)
pinMode(ser,9,"OUTPUT")
digiWrite(ser,9,1)
sleep(2)
digiWrite(ser,9,0)
close(ser)
