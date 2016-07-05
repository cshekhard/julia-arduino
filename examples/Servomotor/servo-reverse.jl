using SerialPorts
using ArduinoTools

ser = connectBoard(115200)
ServoAttach(ser,1)
ServoMove(ser,1,90)
sleep(1)
ServoMove(ser,1,45)
sleep(1)
close(ser)
