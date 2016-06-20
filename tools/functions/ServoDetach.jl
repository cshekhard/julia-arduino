using SerialPorts

function ServoDetach(file_des::SerialPorts.SerialPort, servo_no::Int64)
  if servo_no == 1
    pin = "Sd1"
    write(file_des,pin)
  elseif servo_no == 2
    pin = "Sd2"
    write(file_des,pin)
  else
    println("Error")
  end
end
