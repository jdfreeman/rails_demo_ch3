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

        fill_in "Name", with: "Example User"
        fill_in "Email", with: "user@example.com"
        fill_in "Password", with: "foobar"
        fill_in "Confirm Password", with: "foobar"
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
    before do
      sign_in user
      visit edit_user_path(user)
    end

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

    context "with valid user data" do
      let (:new_name) { "New Name" }
      let (:new_email) { "new_email@example.com" }

      before do

        fill_in "Name", with: new_name
        fill_in "Email", with: new_email
        fill_in "Password", with: user.password
        fill_in "Confirm Password", with: user.password
        click_button "Save Changes"
      end

      it "should have the correct content" do
        expect(page).to have_title(new_name)
        expect(page).to have_success_message('Your profile has been successfully updated!')
        expect(page).to have_link('Sign out', href: signout_path)
      end

      it "should update the model in the database" do
        expect(user.reload.name).to eq new_name
        expect(user.reload.email).to eq new_email
      end
    end
  end

  describe "#index" do

    before do
      sign_in FactoryGirl.create(:user)
      FactoryGirl.create(:user, name: "Steve McTillituter", email: "steve@example.com")
      FactoryGirl.create(:user, name: "Ira Sockman", email: "irs.sockman@example.com")
      visit users_path
    end

    it "should have the correct content" do
      expect(page).to have_content("All users")
      expect(page).to have_title("All users")
    end

    describe "pagination" do

      before(:all) { 30.times { FactoryGirl.create(:user) } }
      after(:all) { User.delete_all }

      it "should have the correct selector" do
        expect(page).to have_selector('div.pagination')
      end

      it "should list each user" do
        User.paginate(page: 1) do |user|
          expect(page).to have_selector('li', text:user.name)
        end
      end
    end
  end
end