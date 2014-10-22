require 'spec_helper'

describe Project do	

    before { @project = FactoryGirl.create(:project) }

    subject { @project }
    it { should respond_to(:title) }
    it { should respond_to(:user_id) }
    it { should respond_to(:user) }

    it { should be_valid }

  describe "when user_id is not present" do
    before { @project.user_id = nil }
    it { should_not be_valid }
  end

  describe "with title that is too long" do
    before { @project.title = "a" * 141 }
    it { should_not be_valid }
  end

  describe "tasks associations" do

    before do
      @project.tasks.build(content: "test project")
      @project.save
    end
    it "should destroy associated tasks" do
      tasks = @project.tasks.to_a
      expect(tasks).not_to be_empty
      @project.destroy
      tasks.each do |task|
        expect(Task.where(id: task.id)).to be_empty
      end
    end
  end

end