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

  context "when authenticated and authorized" do
    let(:micropost_2) { FactoryGirl.build(:micropost, user: user) }
    before { sign_in user }

    describe "creating a micropost" do
      before { post microposts_path }

      it "should store a new micropost" do
        expect{ micropost_2 }.not_to be_nil
      end
    end

    describe "deleting a micropost" do

      let!(:micropost_3) { FactoryGirl.create(:micropost, user: user)}
      let!(:count) { Micropost.count }
      before do
        sign_in user
        delete micropost_path(micropost)
      end

      it "should delete a micropost" do
        expect{ Mircopost.count }.to eq(count-1)
      end

      it "should delete THE micropost" do
        expect( Micropost.find(micropost) ).to be_nil
      end
    end
  end
end