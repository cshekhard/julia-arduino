using SerialPorts
include("ArduinoTools.jl")

function readCurrent()
  str = string(Char(1))*string(Char(3))*string(Char(15))*string(Char(88))*string(Char(0))*string(Char(2))*string(Char(70))*string(Char(204))
  ser = connectBoard(9600)
  write(ser,str)
  sleep(0.1)
  s = readavailable(ser)
  close(ser)
  s = s[end-7:end]
  current = hex2num(s)
  println("The Current in A is:")
  println(current)
end

readCurrent()
