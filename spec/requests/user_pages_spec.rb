require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "signup page" do

    before { visit signup_path }

    it { should have_selector 'h1', text: 'Sign Up' }
    it { should have_title(full_title('Sign Up')) }
  end

  describe 'profile page' do

    let (:user) { FactoryGirl.create(:user) }
    before { visit profile_path }

    it { should have_content(user.name) }
    it { should have_content(user.email) }
  end
end