require 'net/http'

RSpec.describe 'server' do
  it "responds to web requests" do
    response = Net::HTTP.get_response('google.com','/')
    expect(response["Location"]).to eq 'http://www.google.com/'
    expect(response.code).to eq '301'
    expect(response.body).to match /html/i
  end
end
