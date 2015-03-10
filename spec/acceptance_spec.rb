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
    server = Server.new(8889)
    t = Thread.new {server.start}
    response = Net::HTTP.get_response('localhost','/',8889)
    expect(response["Content-Length"]).to eq '11'
    t.kill
  end

  xit "responds to web requests" do
    response = Net::HTTP.get_response('localhost','/',8889)
    expect(response["Location"]).to eq 'http://www.google.com/'
    expect(response.code).to eq '301'
    expect(response.body).to match /html/i
  end
end
