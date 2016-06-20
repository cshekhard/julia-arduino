using SerialPorts

function analogWrite(file_des::SerialPorts.SerialPort , pin_no::Int64 , val::Int64)
  if val > 255 val = 255 end            # Make sure val isn't beyond limits
  if val < 0 val = 0 end
  c = Char(val)                         # Conversion of val into character
  d = string(c)                         # Converting character to string
  s = "W"*string(Char(48+pin_no))*d     # Wnm for analog value m on pin n
  write(file_des,s)
end
