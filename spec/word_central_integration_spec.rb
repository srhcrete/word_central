require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('word central dictionary', {:type => :feature}) do
  it('stores and displays information about user words') do
    visit('/')
    fill_in('word', :name => 'fragment')
    fill_in('definition', :definition => ['a small part broken or seperated off something', 'to break or cause to break into fragments'])
    click_button('Add word and definition')
    expect(page).to have_content('fragment')
  end
end
require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_excepeptions, false)

describe('list path', {:type => :feature}) do
  it "will display user input into list" do
    visit('/')
    fill_in('word', :name => 'fragment')
    fill_in('definition', :definition => 'a small part broken or seperated off something')
    click_button('Add word or definition')
    expect(page).to have_content('fragment')
  end
  it "display name of clicked link" do
    visit('/')
    click_link('fragment')
    expect(page).to have_content('name: fragment')
    expect(page).to have_content('definition: a small part broken or seperated off something')
  end
  it "delete item" do
    visit('/entry/fragment')
    click_button('Delete!')
    visit('/')
    expect(page).to have_no_content('name: fragment')
  end
  # it "will add definition to word object" do
  #   visit('/')
  #   fill_in('name', :with => 'fragment')
  #   fill_in('last', :with => 'a small part broken or seperated off something')
  #   click_button('Go!')
  #   visit('/entry/fragment')
  #   click_link('add another definition')
  #   visit('/definition/fragment')
  #   fill_in('name', :with => 'fragment')
  #   fill_in('definition', :with => 'a small part broken or seperated off something', 'to break or cause to break into fragments')
  #   click_button('Update')
  #   visit('/')
  #   expect(page).to have_content('fragments')
  # end
end
