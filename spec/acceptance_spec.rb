require 'net/http'
require 'pry'
require 'server_stuff'

RSpec.describe 'server' do
  it "responds to web requests" do
    response = Net::HTTP.get_response('google.com','/')
    expect(response["Location"]).to eq 'http://www.google.com/'
    expect(response.code).to eq '301'
    expect(response.body).to match /html/i
  end

  it "responds to web requests" do
    server = Server.new(8889) do |server_response|
      server_response.code = 200
      server_response.body = "Hello World"
    end
    t = Thread.new {server.start}
    t.abort_on_exception = true
    client_response = Net::HTTP.get_response('localhost','/',8889)
    expect(client_response["Content-Length"]).to eq '11'
    expect(client_response.code).to eq '200'
    expect(client_response.body).to eq "Hello World"
    t.exit
  end

  it "responds to web requests" do
    server = Server.new(8889) do |server_response|
      server_response.code = 301
    end
    t = Thread.new {server.start}
    t.abort_on_exception = true
    client_response = Net::HTTP.get_response('localhost','/',8889)
    #expect(client_response["Location"]).to eq 'http://www.google.com/'
    expect(client_response.code).to eq '301'
    expect(client_response.body).to match /html/i
    t.exit
  end
end
