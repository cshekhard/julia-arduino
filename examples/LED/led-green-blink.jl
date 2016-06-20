using SerialPorts
include("ArduinoTools.jl")

ser = connectBoard(115200)
pinMode(ser,10,"OUTPUT")
for i = 1:5
  digiWrite(ser,10,1)
  sleep(1)
  digiWrite(ser,10,0)
  sleep(1)
end
close(ser)
