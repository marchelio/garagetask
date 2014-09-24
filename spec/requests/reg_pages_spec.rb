require 'rails_helper'

describe "User pages" do
  subject { page }

  describe "Registr page" do
    before { visit registration_path }

    it { should have_content('Registration') }
  end
end
