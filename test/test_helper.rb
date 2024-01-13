ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors, with: :threads)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Use transactional tests to ensure a clean state for each test
  self.use_transactional_tests = true

  # Include Devise test helpers
  include Devise::Test::IntegrationHelpers
end
