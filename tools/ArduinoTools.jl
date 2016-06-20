using SerialPorts

function connectBoard(baudrate::Int64)
  arr = list_serialports()
  port = arr[1]
  ser = SerialPort(port,baudrate)
  sleep(2)
  return ser
end

function pinMode(file_des::SerialPorts.SerialPort , pin_no::Int64 , mode::ASCIIString)
  m = uppercase(mode)                                             # Prevent errors due to case differences
  if m == "INPUT"  str = "Da"*string(Char(48+pin_no))*"0"  end    # Dan0 for INPUT
  if m == "OUTPUT"  str = "Da"*string(Char(48+pin_no))*"1"  end   # Dan1 for OUTPUT
  str = ascii(str)                                                # Converts UTF8String to ASCIIString
  write(file_des,str)
end

function digiWrite(file_des::SerialPorts.SerialPort , pin_no::Int64 , val::Int64)
  if val > 0 str = "Dw"*string(Char(48+pin_no))*"1" end    # Dwn1 for HIGH
  if val == 0 str = "Dw"*string(Char(48+pin_no))*"0" end   # Dwn0 for LOW
  str = ascii(str)                                         # Converts UTF8String to ASCIIString
  write(file_des,str)
end

function digiRead(file_des::SerialPorts.SerialPort , pin_no::Int64)
  str = "Dr"*string(Char(48+pin_no))  # Drn to read digital pin n
  str = ascii(str)                    # Convert UTF8String to ASCIIString
  write(file_des,str)
  sleep(0.01)                         # Delay the next step by 10 milliseconds
  c = read(file_des,1)                # Read one byte from SerialPort
  n = parse(Int,c)                    # Convert the received string into integer
  return n                            # Return the integer
end

function analogWrite(file_des::SerialPorts.SerialPort , pin_no::Int64 , val::Int64)
  if val > 255 val = 255 end            # Make sure val isn't beyond limits
  if val < 0 val = 0 end
  c = Char(val)                         # Conversion of val into character
  d = string(c)                         # Converting character to string
  s = "W"*string(Char(48+pin_no))*d     # Wnm for analog value m on pin n
  write(file_des,s)
end

function analogRead(file_des::SerialPorts.SerialPort , pin_no::Int64)
  str = "A"*string(Char(48+pin_no))  # "An" for analog value on pin n
  write(file_des,str)
  sleep(0.1)                         # Delay next step by 10 milliseconds
  n = nb_available(file_des)         # Get number of bytes in input buffer
  s = read(file_des,n)               # Read n bytes from SerialPort
  if sizeof(s) == 0 return 300 end
  k = parse(Int,s)                   # Convert String to integer
  return k                           # Return the integer
end


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


function DCMotorRelease(file_des::SerialPorts.SerialPort, motor_no::Int64)
  code_sent = "M"*string(motor_no)*"1"string(Char(0))  # Stops the motor first
  write(file_des,code_sent)
  sleep(0.1)                                           # Delay of 0.1 second
  code_sent = "M"*string(motor_no)*"r"                 # Releases the motor
  write(file_des,code_sent)
end


function ServoAttach(file_des::SerialPorts.SerialPort, servo_no::Int64)
  println("Initializing servo")
  if servo_no == 1
    pin = "Sa1"
    write(file_des,pin)
  elseif servo_no == 2
    pin = "Sa2"
    write(file_des,pin)
  else
    println("Error")
  end
end


function ServoMove(file_des::SerialPorts.SerialPort, servo_no::Int64, val::Int64)
  if val < 0 val = 0 end
  if val >180 val = 180 end
  pin = "Sw"*string(servo_no)*string(Char(val))
  write(file_des,pin)
end


function ServoDetach(file_des::SerialPorts.SerialPort, servo_no::Int64)
  if servo_no == 1
    pin = "Sa1"
    write(file_des,pin)
  elseif servo_no == 2
    pin = "Sa2"
    write(file_des,pin)
  else
    println("Error")
  end
end
