using SerialPorts

function connectBoard(baudrate::Int64)
  arr = list_serialports()
  port = arr[1]
  ser = SerialPort(port,baudrate)
  sleep(2)
  return ser
end
