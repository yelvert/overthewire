require 'socket'

socket = TCPSocket::new "vortex.labs.overthewire.org", 5842

numbers = []
4.times do
  num = socket.recvfrom(4)[0].unpack('V')[0]
  numbers << num
end
sum = numbers.reduce(:+)
puts "Numbers: #{numbers.inspect}"
puts "Sum: #{sum}"
response = [sum].pack('V')
socket.write response
password = socket.read
socket.close
puts password