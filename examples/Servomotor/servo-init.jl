using SerialPorts
using ArduinoTools

ser = connectBoard(115200)
ServoAttach(ser,1)
ServoMove(ser,1,30)
sleep(1)
close(ser)
