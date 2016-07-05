using SerialPorts
using ArduinoTools

ser = connectBoard(115200)
ServoAttach(ser,1)
for i = 1:500
  p = analogRead(ser,2)
  p = p*(180/1023)
  q = round(Int,floor(p))
  ServoMove(ser,1,q)
  sleep(0.5)
end
ServoDetach(ser,1)
close(ser)
