using SerialPorts

function DCMotorRelease(file_des::SerialPorts.SerialPort, motor_no::Int64)
  code_sent = "M"*string(motor_no)*"1"string(Char(0))  # Stops the motor first
  write(file_des,code_sent)
  sleep(0.1)                                           # Delay of 0.1 second
  code_sent = "M"*string(motor_no)*"r"                 # Releases the motor
  write(file_des,code_sent)
end
