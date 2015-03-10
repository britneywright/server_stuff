require 'net/http'
require 'pry'
require 'socket'

class Server
  def initialize(port)
    @port = port
  end
  def start
    server = TCPServer.new(@port)
    puts "Running now"
    loop do
      s = server.accept
      request = s.gets
      STDERR.puts request
      response = "HTTP/1.1 200 OK\r\n" +
              "Content-Type: text/plain\r\n" +
              "Content-Length: 11\r\n" +
              "Connection: close\r\n\r\n" +
              "Hello World"
      s.print response
      s.close
    end
  end
end
