require 'spec_helper'

describe 'Authentication process' do

  subject { page }

  before { visit signin_path }

  context "when visiting the sign in page" do
    it "should have correct content" do
      expect(page).to have_content('Sign in')
      expect(page).to have_title('Sign in')
    end
  end

  context "when authenticating with invalid credentials" do
    before do
      visit signin_path
      click_button 'Sign in'
    end

    it "should display an error" do
      expect(page).to have_error_message('Email or password invalid')
    end
  end

  context "when authenticating with valid credentials" do

    let(:user) { FactoryGirl.create(:user) }

    before { sign_in user }

    it "should show the correct content" do
      expect(page).to have_title(user.name)
      expect(page).to have_link('Users', href: users_path)
      expect(page).to have_link('Profile', href: user_path(user))
      expect(page).to have_link('Settings', href: edit_user_path(user))
      expect(page).to have_link('Sign out', href: signout_path)
      expect(page).not_to have_link('Sign In', href: signin_path)
    end

    describe "followed by signing out" do

      before { click_link 'Sign out' }

      it "should display the correct content" do
        expect(page).to have_link 'Sign in'
      end
    end
  end
end
