using SerialPorts

function analogRead(file_des::SerialPorts.SerialPort , pin_no::Int64)
  str = "A"*string(Char(48+pin_no))  # "An" for analog value on pin n
  write(file_des,str)
  sleep(0.01)                        # Delay next step by 10 milliseconds
  n = nb_available(file_des)         # Get number of bytes in input buffer
  s = read(file_des,n)               # Read n bytes from SerialPort
  k = parse(Int,s)                   # Convert String to integer
  return k                           # Return the integer
end
