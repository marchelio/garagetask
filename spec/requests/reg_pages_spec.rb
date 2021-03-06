require 'spec_helper'

describe "Registr page" do

  before { visit '/registration' }
	subject { page }
	let(:submit) { "Sign up" }

	it { should have_content('Registration') }

	describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
  end

    describe "with valid information" do
      before do
        fill_in "Name",         with: "Example User"
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: "foobar"
        fill_in "Confirmation", with: "foobar"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end

      describe "after saving the user" do
        before { click_button submit }
        let(:user) { User.find_by(email: 'user@example.com') }

        it { should have_link('Sign out',    href: '/signout') }
        it { should have_content("Hello, #{user.name}") }
      end

    end

end
