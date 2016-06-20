using SerialPorts

function ServoMove(file_des::SerialPorts.SerialPort, servo_no::Int64, val::Int64)
  if val < 0 val = 0 end                         # checking for validity of angle
  if val >180 val = 180 end

  pin = "Sw"*string(servo_no)*string(Char(val))
  write(file_des,pin)
end
