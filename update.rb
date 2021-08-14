# frozen_string_literal: true

require 'json'
require 'net/http'
require 'open-uri'
require 'selenium-webdriver'

@driver = Selenium::WebDriver.for :chrome
@wait = Selenium::WebDriver::Wait.new(timeout: 90) # avoid selenium to quit too soon before the test is done running
@token = ENV['SLACK_TOKEN']


# uses fast.com to check for internet speed
def check_speed
    begin
      @driver.get 'https://fast.com'
      #  here we wait until the speed test is done then we grab the speed and close the browser
      first_result = @wait.until { @driver.find_element(css: '#speed-value.succeeded') }
      speed = first_result.attribute('textContent')
      speed
    ensure
      @driver.quit
    end
end


# This attempts to update slack status that you are having a bad day
def slack_update_handler
    message = {
        "status_text":'Currently facing a bad internet',
        "status_emoji":':cry:'
    }
    parsed_message = message.to_json

    base_url = "https://slack.com/api/users.profile.set?profile=#{message}&token=#{@token}"
    uri = URI.parse(base_url)
    puts uri
    request = Net::HTTP::Post.new(uri)
    req_options = {use_ssl: uri.scheme == "https"}
    Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
        res = http.request(request)
        res
    end
    rescue => exception
        puts exception
end

def update_slack
    speed = check_speed
    slack_update_handler if speed.to_i < 1

    puts speed
end

update_slack