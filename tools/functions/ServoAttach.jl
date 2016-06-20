using SerialPorts

function ServoAttach(file_des::SerialPorts.SerialPort, servo_no::Int64)
  println("Initializing servo")
  if servo_no == 1             # for servomotor attached to digital pin 9
    pin = "Sa1"
    write(file_des,pin)
  elseif servo_no == 2         # for servomotor attached to digital pin 10
    pin = "Sa2"
    write(file_des,pin)
  else
    println("Error")
  end
end                            # end function
