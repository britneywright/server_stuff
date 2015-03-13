require 'net/http'
require 'pry'
require 'socket'

class Server
  attr_accessor :code, :body

  def initialize(port)
    @port = port
    @code = code
    @body = body
    yield self if block_given?
  end

  def start
    @server = TCPServer.new(@port)
    puts "Running now"
    loop do
      s = @server.accept
      request = s.gets
      STDERR.puts request
      response = "HTTP/1.1 #{@code} OK\r\n" +
              "Content-Type: text/plain\r\n" +
              "Content-Length: 11\r\n" +
              "Connection: close\r\n\r\n" +
              "#{@body}"
      s.print response
      s.close
    end
  end

  def stop
    @server.close_read
    @server.close_write
  end
end
