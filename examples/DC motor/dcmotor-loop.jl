using SerialPorts
include("ArduinoTools.jl")

ser = connectBoard(115200)
DCMotorSetup(ser,3,1,9,10)
for i = 1:4
  DCMotorRun(ser,1,100)
  sleep(3)
  DCMotorRun(ser,1,0)
  sleep(2)
  DCMotorRun(ser,1,-100)
  sleep(2)
end
DCMotorRelease(ser,1)
close(ser)
