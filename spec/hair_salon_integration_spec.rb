require('capybara/rspec')
require('./app')
require('./spec/spec_helper')

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('', {:type => :feature}) do
  it('') do
    
  end
end
