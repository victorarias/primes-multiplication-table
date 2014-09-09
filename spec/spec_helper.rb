$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), "../lib"))

RSpec.configure do |config|
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.order = :random
  Kernel.srand config.seed
end
