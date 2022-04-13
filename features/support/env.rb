require 'appium_lib'
require 'cucumber'
require 'selenium-webdriver'
require 'rspec'
require 'report_builder'
require 'capybara'
require 'capybara/cucumber'
require 'capybara/dsl'
require 'capybara/rspec/matchers'
require 'yaml'
require 'logger'

#World Page

World Capybara::DSL 
World Capybara::RSpecMatchers


$wait = Selenium::WebDriver::Wait.new(timeout: 20)
time  = Time.new
time = time.strftime('%d-%m-%Y')
$logger = Logger.new("./exec-logs/exec-log-#{time}.log")

def load_appium_configuration(platform)
  dir = "#{Dir.pwd}/config/#{platform}/appium.txt"
  Appium.load_appium_txt file: File.expand_path(dir, __FILE__), verbose: true
end

PLATFORM_NAME = ENV['PLATFORM_NAME'].downcase

case PLATFORM_NAME
when 'android'
  caps = load_appium_configuration(PLATFORM_NAME)
  caps[:appium_lib][:export_session] = true
when 'ios'
  caps = load_appium_configuration(PLATFORM_NAME)
  caps[:appium_lib][:export_session] = true
else
  raise("Plataforma não suportada #{ENV['PLATFORM_NAME']}")
end

Appium::Driver.new(caps, true)
Appium.promote_appium_methods Object


# ReportBuilder.configure do |config|
#     config.input_path = 'results/report.json'
#     config.report_path = 'results/report'
#     config.report_types = [:html]
#     config.report_title = 'Testes Automatizados'
#     config.color = "black"
#     #config.additional_info = {login_utilized: $LOADS["user1"]["login"]}
#   end
  
#   at_exit do
#     ReportBuilder.build_report
#   end
  