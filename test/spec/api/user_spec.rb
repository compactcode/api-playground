require "bundler/setup"

Bundler.require(:default, :test)

Dir['./spec/support/*.rb'].map {|f| require f}

describe "GET" do
  
  it "should return requested postcode" do
    user = Factory.create(:user)
    postcode = Factory.create(:postcode)
    details = RestClient.get("http://#{user.key}:#{user.secret}@127.0.0.1:8080/postcodes/#{postcode.code}")
    JSON.parse(details)["name"].should == postcode.name
  end

  it "should return 404 when requested postcode does not exist" do
    user = Factory.create(:user)
    lambda {
      details = RestClient.get("http://#{user.key}:#{user.secret}@127.0.0.1:8080/postcodes/9876")
    }.should raise_exception(RestClient::ResourceNotFound)
  end

  it "should return 401 when no authentication provided" do
    lambda {
      RestClient.get("http://127.0.0.1:8080/postcodes/3000")
    }.should raise_exception(RestClient::Unauthorized)
  end

  it "should return 401 when invalid authentication provided" do
    lambda {
      RestClient.get("http://hax:or@127.0.0.1:8080/postcodes/3000")
    }.should raise_exception(RestClient::Unauthorized)
  end
  
end
