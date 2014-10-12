require 'spec_helper'

describe "StartPages" do

  subject { page }
  before {visit root_path}

  describe "Sign-in page" do
    it { should have_content('Just do it!') }
  end

  describe "with invalid information" do
      before { click_button "Sign in" }

      it { should have_content('Just do it!') }
      it { should have_selector('div.alert.alert-error') }
  end

  describe "with valid information" do
    let(:user) { FactoryGirl.create(:user) }
    let!(:p1) { FactoryGirl.create(:project, user: user, title: "Foo") }
    let!(:p2) { FactoryGirl.create(:project, user: user, title: "Bar") }

    before do
      fill_in "Email",    with: user.email.upcase
      fill_in "Password", with: user.password
      click_button "Sign in"
    end

    it { should have_link('Sign out',    href: signout_path) }
    it { should have_content("Hello, #{user.name}") }

    describe "projects" do
      it { should have_content(p1.title) }
      it { should have_content(p2.title) }
      it { should have_content(user.projects.count) }
    end

   end

end
