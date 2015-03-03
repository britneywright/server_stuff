require 'server'

RSpec.describe Server, 'request' do
  context "request not found" do
    request = Server::Request.new("http://google.com")
    it "returns a header" do
      response = Server::Response.new("http://google.com")
      expect(response.header).to eq "HTTP/1.1 301 Moved Permanently\r\nLocation: http://www.google.com/\r\nContent-Type: text/html; charset=UTF-8\r\nDate: Fri, 27 Feb 2015 16:36:25 GMT\r\nExpires: Sun, 29 Mar 2015 16:36:25 GMT\r\nCache-Control: public, max-age=2592000\r\nServer: gws\r\nContent-Length: 219\r\nX-XSS-Protection: 1; mode=block\r\nX-Frame-Options: SAMEORIGIN\r\nAlternate-Protocol: 80:quic,p=0.08\r\n\r\n"
    end
    it "returns a body" do
      response = Server::Response.new("http://google.com")
      expect(response.body).to eq "<HTML><HEAD><meta http-equiv=\"content-type\" content=\"text/html;charset=utf-8\">\n<TITLE>301 Moved</TITLE></HEAD><BODY>\n<H1>301 Moved</H1>\nThe document has moved\n<A HREF=\"http://www.google.com/\">here</A>.\r\n</BODY></HTML>\r\n"
    end
  end
end
