module ControllerMacros
  def login_admin
    before do
      warden.set_user(build(:user))
    end
  end
end

RSpec.configure do |config|
  config.include Devise::Test::IntegrationHelpers
  config.extend ControllerMacros
end
