using SerialPorts

function DCMotorRun(file_des::SerialPorts.SerialPort, motor_no::Int64, speed::Int64)

  sgn = sign(speed)                    # Checking sign of speed to set direction
  if sgn >= 0
    direction = "1"
  else
    direction = "0"
  end

  speed = abs(speed)                   # Dropping the sign
  if speed > 255 speed = 255  end      # Make sure speed is not beyond limit

  code_sent = "M"*string(motor_no)*direction*string(Char(speed))
  write(file_des,code_sent)

end                                    # end function
