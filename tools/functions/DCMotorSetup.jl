using SerialPorts

function DCMotorSetup(file_des::SerialPorts.SerialPort, driver_type::Int64, motor_no::Int64, pin1::Int64, pin2::Int64)
  println("Initializing motor")

  if (driver_type == 1)
      code_sent = "C"*string(motor_no)*string(Char(48+pin1))*string(Char(48+pin2))*"1"   # adafruit
  elseif (driver_type == 2)
      code_sent = "C"*string(motor_no)*string(Char(48+pin1))*string(Char(48+pin2))*"1"   # L298
  elseif (driver_type == 3)
      code_sent = "C"*string(motor_no)*string(Char(48+pin1))*string(Char(48+pin2))*"0"   # L293
  end

  write(file_des,code_sent)
  sleep(0.1)                      # sleep for a tenth of a second
  s = readavailable(file_des)     # read all available bytes from input buffer

  if s == "OK"
    println("Motor Setup Successful")
  else
    println("Motor Setup unsuccessful")
  end
end   # end function
