using SerialPorts
using ArduinoTools

ser = connectBoard(115200)
ServoAttach(ser,1)
sleep(1)
j = 0
k = 0
r = 0
ServoMove(ser,1,90)
for i = 1:9
  p = analogRead(ser,0)
  println(p)
  q = analogRead(ser,1)
  println(q)
  k = p-q
  r = q-p
  if p<q && r>10
    j = j+1
    ServoMove(ser,1,90-10j)
    sleep(0.5)
  end
  if p>q && k>10
    j = j-1
    ServoMove(ser,1,90-10j)
    sleep(0.5)
  end
  sleep(1)
end
ServoDetach(ser,1)
close(ser)
