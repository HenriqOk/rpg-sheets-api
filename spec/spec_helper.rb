# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
# require 'rspec/autorun'

Mongoid.logger.level = Logger::INFO
Mongo::Logger.logger.level = Logger::INFO


# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
# Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods

  config.filter_run_excluding broken: true
  # config.include(RSpec::Helpers::Integration, :type => :request)

  config.before(:each) do
    Mongoid.default_client.collections.each { |c| c.delete_many }
  end

  config.order = "random"

  config.include Devise::TestHelpers, type: :controller
end
