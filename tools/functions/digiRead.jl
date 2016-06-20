using SerialPorts

function digiRead(file_des::SerialPorts.SerialPort , pin_no::Int64)
  str = "Dr"*string(Char(48+pin_no))  # Drn to read digital pin n
  str = ascii(str)                    # Convert UTF8String to ASCIIString
  write(file_des,str)
  sleep(0.01)                         # Delay the next step by 10 milliseconds
  c = read(file_des,1)                # Read one byte from SerialPort
  n = parse(Int,c)                    # Convert the received string into integer
  return n                            # Return the integer
end
