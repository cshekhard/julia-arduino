using SerialPorts
include("ArduinoTools.jl")

ser = connectBoard(115200)
ServoAttach(ser,1)
sleep(1)
angle = 20
for i = 1:9
  ServoMove(ser,1,angle*i)
  sleep(1)
end
ServoDetach(ser,1)
close(ser)
