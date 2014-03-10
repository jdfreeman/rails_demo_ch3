require 'spec_helper'

describe "Authentication" do

  subject { page }

  describe "sign in page" do

    before { visit signin_path }

    it { should have_content('Sign in')}
    it { should have_title('Sign in')}

    describe "with invalid login credentials" do
      it { should have_selector('div.alert.alert-error') }
    end

    describe "with valid login credentials" do

      let(:user) { FactoryGirl.create(:user) }

      before do

        fill_in 'email', with: user.email
        fill_in 'password', with: user.password
        click_button 'Sign in'
      end

      it { should have_title(user.name) }
      it { should have_link('Sign out', href: signout_path) }
      it { should have_link('Profile', href: user_path(user)) }
      it { should_not have_link('Sign In', href: signin_path) }
    end
  end
end
