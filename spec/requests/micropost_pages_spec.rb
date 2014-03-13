require 'spec_helper'

describe "Micropost pages" do

  let(:user) { FactoryGirl.create(:user) }
  before do
    sign_in user
    visit root_path
  end

  subject { page }

  describe "micropost creation" do

    context "when data is invalid" do
      before { click_button "Post" }

      it "should not create a post" do
        expect{ Micropost.count }.not_to change(Micropost, :count)
      end

      it "should display an error message" do
        expect(page).to have_error_message('')
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

  # describe "micropost deletion" do

  #   it "should destroy the micropost" do
  #     expect{ click_link "delete" }.to change(Micropost, :count).by(-1)
  #   end
  # end
end