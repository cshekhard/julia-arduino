using SerialPorts

function digiWrite(file_des::SerialPorts.SerialPort , pin_no::Int64 , val::Int64)
  if val > 0 str = "Dw"*string(Char(48+pin_no))*"1" end  # Dwn1 for HIGH
  if val == 0 str = "Dw"*string(Char(48+pin_no))*"0" end   # Dwn0 for LOW
  str = ascii(str)    # Converts UTF8String to ASCIIString
  write(file_des,str)
end
