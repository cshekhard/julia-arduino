using SerialPorts
include("ArduinoTools.jl")

function readVoltage()
  str = string(Char(1))*string(Char(3))*string(Char(15))*string(Char(86))*string(Char(0))*string(Char(2))*string(Char(39))*string(Char(15))
  ser = connectBoard(9600)
  write(ser,str)
  sleep(0.1)
  s = readavailable(ser)
  close(ser)
  s = s[end-7:end]
  voltage = hex2num(s)
  println("The Voltage in V is:")
  println(voltage)
end

readVoltage()
