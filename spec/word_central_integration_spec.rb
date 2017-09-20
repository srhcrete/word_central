require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('word', {:type => :feature}) do
  it('adds words to dictionary list') do
    visit('/')
    fill_in('name', :with => 'fragment')
    fill_in('definition', :with => 'a small part broken or seperated off something')
    click_button('Add!')
    expect(page).to have_content('fragment')
  end

  it('displays word and definition page') do
    visit('/')
    click_link('fragment')
    expect(page).to have_content('fragment')
    expect(page).to have_content('Definition 1: a small part broken or seperated off something')
  end

  it ('will add many definitions to words') do
    visit('/')
    fill_in('name', :with => 'fragment')
    fill_in('definition', :with => 'a small part broken or seperated off something')
    click_link('fragment')
    click_link('Add another definition')
    visit('/definition/1')
    fill_in('definition', :with => 'to break or cause to break into fragments')
    click_button('Add!')
    expect(page).to have_content('fragment')
  end
end
