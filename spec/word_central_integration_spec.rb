require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('word', {:type => :feature}) do
  it('display words from user input into dictionary list') do
    visit('/')
    fill_in('name', :with => 'fragment')
    fill_in('definition', :with => 'a small part broken or seperated off something')
    click_button('Add word and definition')
    expect(page).to have_content('fragment')
  end
  it "display name of clicked word link" do
    visit('/entry/1')
    click_link('fragment')
    expect(page).to have_content('name: fragment')
    expect(page).to have_content('definition: a small part broken or seperated off something')
  end
  it "delete item" do
    visit('/entry/1')
    click_button('Delete!')
    visit('/')
    expect(page).to have_no_content('fragment')
  end
  it "will add definition to word object" do
    visit('/')
    fill_in('name', :with => 'fragment')
    fill_in('last', :with => 'a small part broken or seperated off something')
    click_button('Go!')
    visit('/entry/fragment')
    click_link('add another definition')
    visit('/definition/fragment')
    fill_in('name', :with => 'fragment')
    fill_in('definition', :with => 'to break or cause to break into fragments')
    click_button('update')
    visit('/')
    expect(page).to have_content('fragment')
  end
end
