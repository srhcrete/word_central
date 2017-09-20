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

  it('display word and definition page') do
    visit('/')
    click_link('fragment')
    visit('/entry/1')
    expect(page).to have_content('Word: fragment')
    expect(page).to have_content('Definition: a small part broken or seperated off something')
  end

  it ('will add many definitions to words') do
    visit('/')
    fill_in('name', :with => 'fragment')
    fill_in('definition', :with => 'a small part broken or seperated off something')
    click_link('fragment')
    visit('/entry/1')
    click_link('Add another definition')
    visit('/definition/1')
    fill_in('definition', :with => 'to break or cause to break into fragments')
    click_button('Add!')
    visit('/entry')
    expect(page).to have_content('Word: fragment')
    expect(page).to have_content('Definitions:')
    expect(page).to have_content('a small part broken or seperated off something')
    expect(page).to have_content('to break or cause to break into fragments')
  end
end
