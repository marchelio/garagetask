require 'rails_helper'

require 'capybara/rspec'
require 'capybara/rails'

describe "StartPages" do
  describe "Sign-in page" do
    it "should have the content 'Hello'" do
      visit root_path
      expect(page).to have_content('Hello')
    end
  end
end
