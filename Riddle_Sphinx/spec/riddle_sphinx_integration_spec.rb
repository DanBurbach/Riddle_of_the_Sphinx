require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the sphinx riddle path', {:type => :feature}) do
  it('processes the user entry and returns whether it is a square or not') do
    visit('/')
    fill_in('first_question', :with => 'thing')
    click_button('Are you sure that is the answer you want?!')
    expect(page).to have_content('answered')
  end
end
