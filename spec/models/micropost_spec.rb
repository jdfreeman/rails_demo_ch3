require 'spec_helper'

describe Micropost do

  let(:user) { FactoryGirl.create(:user) }
  before do
    @micropost = user.microposts.build(content: "Lorem ipsum")
  end

  it "should respond to the :content attribute" do
    expect(@micropost).to respond_to(:content)
  end

  it "should respond to the :user_id attribute" do
    expect(@micropost).to respond_to(:user_id)
  end

  it "should respond to the :user attribute" do
    expect(@micropost).to respond_to(:user)
  end

  it "should have the correct user association" do
    expect(user).to eq @micropost.user
  end

  context "when the user_id attribute is absent" do

    before { @micropost.user_id = nil }

    it "should not pass" do
      expect(@micropost).not_to be_valid
    end
  end

  context "when content is missing" do

    before { @micropost.content = ' '* Random.new.rand(1..100) }

    it "should not be valid" do
        expect(@micropost).not_to be_valid
    end
  end

  context "when content is too long" do

    before { @micropost.content = 'a' * 141 }

    it "should not be valid" do
      expect(@micropost).not_to be_valid
    end
  end
end