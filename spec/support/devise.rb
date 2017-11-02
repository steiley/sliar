module ControllerMacros
  def login_admin
    before(:each) do
      warden.set_user(build(:user))
    end
  end
end

RSpec.configure do |config|
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.extend ControllerMacros
end
