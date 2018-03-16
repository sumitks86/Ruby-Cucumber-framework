Before do |scenario|
  base_driver_url = Dir.pwd + '/features/support/web_drivers'
  Selenium::WebDriver::Firefox.driver_path = "#{base_driver_url}/geckodriver"
  Selenium::WebDriver::Chrome.driver_path = "#{base_driver_url}/chromedriver"
  @browser = Selenium::WebDriver.for :chrome
end
