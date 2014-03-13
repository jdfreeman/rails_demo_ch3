require 'spec_helper'

describe Micropost do
  let(:user) { FactoryGirl.create(:user) }
  let(:micropost) { FactoryGirl.create(:micropost, user: user) }

  context "when not authenticated" do

    describe "creating a micropost" do
      before { post microposts_path }

      it "should redirect to signin_path" do
        expect(page).to redirect_to(signin_path)
      end
    end

    describe "deleting a micropost" do
      before { delete micropost_path(micropost) }

      it "should redirect to signin_path" do
        expect(page).to redirect_to(signin_path)
      end

      it "should not delete the micropost" do
        expect(Micropost.find(micropost)).not_to be_nil
      end
    end
  end

  describe "creating a Micropost" do

  end
end