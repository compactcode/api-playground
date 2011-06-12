require "bundler/setup"

Bundler.require(:default, :test)

Dir['./spec/support/*.rb'].map {|f| require f}

describe "GET" do
  it "should do XXX" do
    user = Factory.create(:user)
    details = RestClient.get("http://#{user.key}:#{user.secret}@127.0.0.1:8080/user/#{user.id}")
    JSON.parse(details)["email"].should == user.email
  end
end
