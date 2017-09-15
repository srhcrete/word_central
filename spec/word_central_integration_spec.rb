require('capybara/rpsec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('') do
  it('stores and displays information about user words') do
    visit('/')
    fill_in('word', :word => 'fragment')
    fill_in('definition', :definition => ['a small part broken or seperated off something', 'to break or cause to break into fragments'])
    click_button('Add word and definition')
    expect(page).to have_content('fragment')
  end
end
