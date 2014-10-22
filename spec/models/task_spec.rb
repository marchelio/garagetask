require 'spec_helper'

describe Task do	

    before { @task = FactoryGirl.create(:task) }

    subject { @task }
    it { should respond_to(:content) }
    it { should respond_to(:done) }
    it { should respond_to(:deadline) }
    it { should respond_to(:project_id) }
    it { should respond_to(:project) }

    it { should be_valid }

  describe "when project_id is not present" do
    before { @task.project_id = nil }
    it { should_not be_valid }
  end

  describe "when content" do
    describe "is not present" do
      before { @task.content= nil }
      it { should_not be_valid }
    end
    describe "is too long" do
      before { @task.content= "a" * 256 }
      it { should_not be_valid }
    end
  end

end