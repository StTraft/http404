=begin
  test third party api return http404 as expected
  rspec version 3.6.0
  assumption:
  - the api tested accept get request on http protocol only
  - no specific headers is required (for example Authorization, Accept ... etc)
  - the ruby class `Net::HTTP` is well tested and can be trust
  limitation:
=end

RSpec.describe "Third party api", type: :request do

  # Specific the host and port of target app here
  app = HttpHelper::App.new host: 'localhost',
                            port: 3000

  it "host is up and run for get request" do
    response = app.get "/"
    expect(response).to be_a_kind_of Net::HTTPOK
  end

  it "has response that can be recognized as http404 if path is not found with get request" do
    #specific the path to test here
    response = app.get "/never-existed"
    expect(response).to be_a_kind_of Net::HTTPNotFound
  end
end