require 'spec_helper'

describe Micropost do

  let(:user) { FactoryGirl.create(:user) }
  before do
    @micropost = Micropost.new(content: "Lorem ipsum", user_id: user.id)
  end

  it "should respond to the :content attribute" do
    expect(@micropost).to respond_to(:content)
  end

  it "should respond to the :user_id attribute" do
    expect(@micropost).to respond_to(:user_id)
  end

  context "when the user_id attribute is absent" do

    before { @micropost.user_id = nil }

    it "should not pass" do
      expect(@micropost).not_to be_valid
    end
  end
end