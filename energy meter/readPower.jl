using SerialPorts
using ArduinoTools

function readPower()
  str = string(Char(1))*string(Char(3))*string(Char(15))*string(Char(78))*string(Char(0))*string(Char(2))*string(Char(167))*string(Char(8))
  ser = connectBoard(9600)
  write(ser,str)
  sleep(0.1)
  s = readavailable(ser)
  close(ser)
  s = s[end-7:end]
  power = hex2num(s)
  println("The Power in W is:")
  println(power)
end

readPower()
