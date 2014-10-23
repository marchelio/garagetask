require 'spec_helper'

describe "StartPages" do

  subject { page }
  before {visit '/'}

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

    it { should have_link('Sign out',    href: '/signout') }
    it { should have_content("Hello, #{user.name}") }

    describe "projects" do
      it { user.projects.each{ |x|  should have_content(x.title)} }
      it { should have_content(user.projects.count) }

      it 'creation' do
        expect { click_button "Add TODO List" }.to change(Project, :count).by(1)
      end

      describe 'update' do
        before do
          within ('#project_<%=p1.id%>') do
            within ('.project-title') do
              fill_in "title", with: "edit_project"
              click_button "submit"
            end
          end
        end
        it 'updating' do
          expect(p1.title).to eq "edit_project"
        end
        it {should have_content(p1.title)}
      end

      it "delete" do
        expect { click_link '', href: "/projects/#{p1.id}"}.to change(Project, :count).by(-1)
      end
    end

    describe "tasks" do
      it { user.tasks.each{ |x|  should have_content(x.content)} }

      describe 'creation' do
        before do
          within ('#project_<%=p1.id%>') do
            fill_in "content", with: "new_task"
          end
        end
        it {expect { click_button "submit" }.to change(Task, :count).by(1)}
      end
    end

   end

end
