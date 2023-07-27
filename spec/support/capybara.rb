RSpec.configure do |config|
  config.before(:each, type: :system) do
    driven_by :selenium, using: :headless_chrome, screen_size: [1920, 1080]
  end
end
Webdrivers::Chromedriver.required_version = '115.0.5790.114'

