require 'rails_helper'

describe "StartPages" do
subject { page }
  describe "Sign-in page" do
  	before {visit root_path}
    it { should have_content('Just do it!') }
  end
end
