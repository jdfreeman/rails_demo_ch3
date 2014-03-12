require 'spec_helper'

describe 'Editing user information' do

  let(:user) { FactoryGirl.create(:user) }

  context 'when current user is authorized' do

    before do
      sign_in user
      visit edit_user_path(user)
    end

    it 'should work' do
      expect(page).to have_content('Update your profile')
    end
  end

  context 'when current user is not authenticated' do

    describe 'and visits User#edit' do

      before { visit edit_user_path(user) }

      it "should show the signin page" do
        expect(page).to have_notice_message('Please log in')
        expect(page).to have_content('Sign in')
      end
    end

    describe 'and PATCHes User' do

      before { patch user_path(user) }

      it "should redirect to the sigin page" do
        expect(page).to redirect_to(signin_path)
      end
    end

    describe "after signing in and is authenticated and authorized" do

      before do
        visit edit_user_path(user)
        fill_in "Email", with: user.email
        fill_in "Password", with: user.password
        click_button "Sign in"
      end

      it 'should render the correct protected page' do
        expect(page).to have_title('Edit user')
      end
    end

    describe "visits user index" do

      before { get users_path }

      it 'should redirect to the signin page' do
        expect(page).to redirect_to(signin_path)
      end
    end
  end

  context 'when current user is authenticated but not authorized' do

    let(:wrong_user) { FactoryGirl.create(:user, email: "wrong-email@example.com") }
    before { sign_in user, no_capybara: true }

    describe 'by submitting a GET request to Users#edit' do
      before { get edit_user_path(wrong_user) }

      it 'should not have the "Edit" title' do
        expect(page).not_to have_title(full_title('Edit user'))
      end

      it 'should redirect to the root url' do
        expect(page).to redirect_to(root_url)
      end

      it 'should display an error message' do
        expect(flash[:notice]).to eq "You are not authorized to complete that action"
      end
    end
  end
end
