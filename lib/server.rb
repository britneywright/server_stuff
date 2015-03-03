require 'curb'
require 'pry'

http = Curl.get("http://google.com")

class Server
  
  class Request 
    def initialize(url)
    end
  end
  
  class Response
    def initialize(url)
    end
    
    def header
    end

    def body
    end
  end

end
