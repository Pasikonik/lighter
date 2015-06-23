ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
# require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/spec'
require 'database_cleaner'
require 'capybara/rails'
require 'capybara/poltergeist'

Capybara.javascript_driver = :poltergeist

require 'minitest/reporters'
Minitest::Reporters.use!

# include ActionController::TestCase::Behavior

class ActionController::TestCase
  include Devise::TestHelpers
end

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  # fixtures :all

  # Add more helper methods to be used by all tests here...
  # class << self
  #   alias_method :context, :describe
  # end
  # extend MiniTest::Spec::DSL
end

# class MiniTest::Spec
#   before :each do
#     DatabaseCleaner.start
#   end

#   after :each do
#     DatabaseCleaner.clean
#   end
# end



## EXTEND TEST CLASSES
# class MiniTest::Spec
#   TYPES[-1] = [//, ActiveSupport::TestCase] # replace MiniTest::Spec with ActiveSupport::TestCase  (use ActiveSupport::TestCase as default spec type)
# end