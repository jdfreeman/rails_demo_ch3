require 'spec_helper'

describe 'Editing user information' do

  let(:user) { FactoryGirl.create(:user) }

  context 'when current user is authorized' do

    before {visit edit_user_path(user) }

    it 'should work' do
      expect(page).to have_content('Update your profile')
    end
  end

  context 'when current user is not authorized' do

    before { visit edit_user_path(user) }

    it "should show the signin page" do
      expect(page).to have_content('Sign in')
    end

    before { patch user_path(user) }

    it "should redirect to the sigin page" do
      expect(page).to redirect_to(signin_path)
    end
  end
end
