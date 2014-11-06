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
    let!(:t1) { FactoryGirl.create(:task, project: p1, content: "task1", priority: 1) }
    let!(:t2) { FactoryGirl.create(:task, project: p1, content: "task2", priority: 2) }

    before do
      fill_in "Email",    with: user.email.upcase
      fill_in "Password", with: user.password
      click_button "Sign in"
    end

    it { should have_link('Sign out',    href: '/signout') }
    it { should have_content("Hello, #{user.name}") }
    it { should have_content("task1") }

    describe "projects" do
      it { user.projects.each{ |x|  should have_content(x.title)} }

      describe 'creation' do
        it 'creation' do
          expect { click_button "Add TODO List" }.to change(Project, :count).by(1)
        end
      end

      describe 'update' do
        before do
          fill_in "input_title_#{p1.id}", with: "edit_project"
          click_button "submit_edit_project_#{p1.id}" 
        end
        it {should have_content("edit_project")}
      end

      it "delete" do
        expect { click_link '', href: "/projects/#{p1.id}"}.to change(Project, :count).by(-1)
      end
    end

    describe "tasks" do
      it { user.tasks.each{ |x|  should have_content(x.content)} }

      describe 'creation' do
        before do
        fill_in "input_create_task_project_#{p1.id}", with: "new_task"
        end
        it {expect { click_button "create_task_project_#{p1.id}" }.to change(Task, :count).by(1)}
      end

      describe 'update' do
        before do
          page.execute_script '$("#task_#{t1.id}").find(".edit-form").show()'
          fill_in "input_content_#{t1.id}", with: "edit_task"
          click_button "submit_edit_task_#{task.id}"
        end
        it {should have_content("edit_task")}
      end

      it "delete" do
        expect { click_link "delet_task_#{t1.id}"}.to change(Task, :count).by(-1)
      end

      it 'up' do
        expect { xhr :get, :up, task: {id: t2.id} }.to change(t2, :priority).by(1)
      end

      it 'down' do
        expect { click_link "", href:"/tasks/#{t1.id}/down"}.to change(t1, :priority).by(-1)
      end

      describe 'done' do
        before do
          check "done_#{t1.id}"
        end
        it "completed" do
          expect(t1).to be_done
        end
      end

      # describe 'deadline'

      # end

    end

   end

end
