using SerialPorts
using ArduinoTools

ser = connectBoard(115200)
pinMode(ser,9,"OUTPUT")
pinMode(ser,10,"OUTPUT")
pinMode(ser,11,"OUTPUT")
for i = 1:10
  p = analogRead(ser,2)
  if p>=0 && p<320
    digiWrite(ser,11,1)
    sleep(1)
    digiWrite(ser,11,0)
  elseif p>=320 && p<=900
    digiWrite(ser,10,1)
    sleep(1)
    digiWrite(ser,10,0)
  elseif p>900 && p<=1023
    digiWrite(ser,9,1)
    sleep(1)
    digiWrite(ser,9,0)
  end
end
close(ser)
