require 'spec_helper'

describe "Micropost pages" do

  let(:user) { FactoryGirl.create(:user) }
  before { sign_in user }

  subject { page }

  describe "micropost creation" do
    before { visit root_path }

    context "when data is invalid" do
      it "should not create a post" do
        expect{ click_button "Post" }.not_to change(Micropost, :count)
      end

      it "should display an error message" do
        before { click_button "Post" }
        expect{ page }.to have_content('error')
      end
    end

    context "when data is valid" do
      before do
        fill_in "micropost_content", with: "Valid content"
      end

      it "should create post" do
        expect { click_button "Post" }.to change(Micropost, :count).by(1)
      end
    end
  end
end