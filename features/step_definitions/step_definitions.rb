Given('I am on the Google search page') do
  require 'rubygems'
  require 'selenium-webdriver'
  # base_driver_url = File.dirname(__FILE__) + '/web_drivers'
  base_driver_url = Dir.pwd + '/web_drivers'
  Selenium::WebDriver::Firefox.driver_path = "#{base_driver_url}/geckodriver"
  Selenium::WebDriver::Chrome.driver_path = "#{base_driver_url}/chromedriver"
  @driver = Selenium::WebDriver.for :chrome
  @driver.get 'http://google.com'
end

When('I search for {string}') do |_string|
  element = @driver.find_element name: 'q'
  element.send_keys 'Cheese!'
  element.submit
end

Then('the page title should start with {string}') do |_string|
  puts "Page title is #{@driver.title}"
  wait = Selenium::WebDriver::Wait.new(timeout: 10)
  wait.until { @driver.title.downcase.start_with? 'cheese!' }
  puts "Page title is #{@driver.title}"
  @driver.quit
end
