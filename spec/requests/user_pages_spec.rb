require 'spec_helper'

describe "User pages" do

  subject { page }

  describe "signup" do

    before { visit signup_path }

    let(:submit) { "Create my account" }

    describe "with invalid information" do

      it "should not create a user" do

        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do

      before do

        fill_in "Name",         with: "Example User"
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: "foobar"
        fill_in "Confirmation", with: "foobar"
      end

      it "should create a user" do

        expect { click_button submit }.to change(User, :count).by(1)
      end

      describe "after saving user" do

        before { click_button submit }
        let(:user) { User.find_by(email: 'user@example.com') }

        it { should have_title(user.name) }
        it { should have_selector('div.alert.alert-success', text: 'Welcome')}
        it { should have_link('Sign out', href: signout_path) }
      end
    end
  end

  describe 'profile page' do

    let (:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

    it { should have_content(user.name) }
    it { should have_title(user.name) }
  end

  context "when editing user data" do

    let(:user) { FactoryGirl.create(:user) }
    before { visit edit_user_path(user) }

    it "should display the correct content" do
      expect(page).to have_content("Update your profile")
      expect(page).to have_title("Edit user")
      expect(page).to have_link('change', href: 'http://gravatar.com/emails')
    end

    context "with incorrect user data" do

      before { click_button 'Save Changes' }

      it "should display errors" do
        expect(page).to have_error_message('error')
      end
    end
  end
end