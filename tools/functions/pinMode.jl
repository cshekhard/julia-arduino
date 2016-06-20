using SerialPorts

function pinMode(file_des::SerialPorts.SerialPort , pin_no::Int64 , mode::ASCIIString)
  m = uppercase(mode)  # Prevent errors due to case differences
  if m == "INPUT"  str = "Da"*string(Char(48+pin_no))*"0"  end    # Dan0 for INPUT
  if m == "OUTPUT"  str = "Da"*string(Char(48+pin_no))*"1"  end   # Dan1 for OUTPUT
  str = ascii(str)   # Converts UTF8String to ASCIIString
  write(file_des,str)
end
