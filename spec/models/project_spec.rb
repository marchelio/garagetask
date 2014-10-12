require 'spec_helper'

describe Project do	
  let(:user) { FactoryGirl.create(:user) }
    before { @project = user.projects.build(title: "test project") }

    subject { @project }
    it { should respond_to(:title) }
    it { should respond_to(:user_id) }
    it { should respond_to(:user) }
    its(:user) { should eq user }

    it { should be_valid }

  describe "when user_id is not present" do
    before { @project.user_id = nil }
    it { should_not be_valid }
  end

  describe "with title that is too long" do
    before { @project.title = "a" * 141 }
    it { should_not be_valid }
  end

end