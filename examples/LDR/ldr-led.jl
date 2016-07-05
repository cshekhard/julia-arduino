using SerialPorts
using ArduinoTools

ser = connectBoard(115200)
pinMode(ser,9,"OUTPUT")
for i = 1:500
  p = analogRead(ser,5)
  println(p)
  if p > 300  digiWrite(ser,9,0)
  else digiWrite(ser,9,1) end
end
close(ser)
