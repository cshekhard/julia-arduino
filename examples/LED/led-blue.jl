using SerialPorts
include("ArduinoTools.jl")

ser = connectBoard(115200)
pinMode(ser,9,"OUTPUT")
digiWrite(ser,9,1)
close(ser)
