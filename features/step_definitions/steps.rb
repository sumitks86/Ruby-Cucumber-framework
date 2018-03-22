Given('I am on the Google search page') do
  @browser.get 'http://google.com'
end

When('I search for {string}') do |_string|
  element = @browser.find_element name: 'q'
  element.send_keys 'Cheese!'
  element.submit
end

Then('the page title should start with {string}') do |_string|
  puts "Page title is #{@browser.title}"
  wait = Selenium::WebDriver::Wait.new(timeout: 10)
  wait.until { @browser.title.downcase.start_with? 'cheese!' }
  puts "Page title is #{@browser.title}"
  @browser.quit
end
