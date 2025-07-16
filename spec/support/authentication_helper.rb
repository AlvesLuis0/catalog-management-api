require 'factory_bot'

module AuthenticationHelper
  def create_auth(**args)
    args[:password_confirmation] = args[:password]
    login = { email: args[:email], password: args[:password] }
    resource = FactoryBot.create(:owner, args)

    post '/auth/login', params: {
      owner: { email: login[:email], password: login[:password] }
    }

    headers = {
      'Authorization' => response.headers['Authorization'],
      'Accept' => 'application/json',
      'Content-Type' => 'application/json'
    }

    [resource, headers]
  end
end

RSpec.configure do |config|
  config.include AuthenticationHelper, type: :request
end
