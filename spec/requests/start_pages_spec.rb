require 'rails_helper'
require 'spec_helper'

describe "StartPages" do
  describe "Sign-in page" do
    it "should have the content 'Hello'" do
      get root_path
      expect(page).to have_content('Hello')
    end
  end
end
