using SerialPorts
include("ArduinoTools.jl")

ser = connectBoard(115200)
DCMotorSetup(ser,3,1,9,10)
DCMotorRun(ser,1,100)
sleep(3)
DCMotorRun(ser,1,-100)
sleep(3)
DCMotorRelease(ser,1)
close(ser)
