ENV["RAILS_ENV"] ||= 'test'
require 'spec_helper'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/its'
require 'shoulda/matchers'
require 'paperclip/matchers'
require 'capybara/rails'

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.include Paperclip::Shoulda::Matchers
  config.include Devise::TestHelpers, type: :controller
  config.extend LoginMacros, type: :controller
  config.include OmniauthMacros

  config.use_transactional_fixtures = true

  config.infer_spec_type_from_file_location!
end
