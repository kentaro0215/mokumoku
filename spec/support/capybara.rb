Webdrivers::Chromedriver.required_version = '114.0.5735.90'

RSpec.configure do |config|
  config.before(:each, type: :system) do
    driven_by :selenium, using: :headless_chrome, screen_size: [1920, 1080]
  end
end
