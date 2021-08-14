# frozen_string_literal: true

require 'nokogiri'
require 'json'
require 'net/http'
require 'open-uri'
require 'watir'
require 'selenium-webdriver'

driver = Selenium::WebDriver.for :chrome
wait = Selenium::WebDriver::Wait.new(timeout: 90)

# message = ""
def check_speed
    begin
      driver.get 'https://fast.com'
      first_result = wait.until { driver.find_element(css: '#speed-value.succeeded') }
      speed = first_result.attribute('textContent')
      puts speed
    ensure
      driver.quit
    end
end


def update_slack

end

def update_github

end