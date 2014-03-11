# require 'spec_helper'

# shared_examples_for 'a protected page' do

#   expected_title = :expected_title
#   let(:user) { FactoryGirl.create(:user) }
#   let(:wrong_user) { FactoryGirl.create(:user, email: "wrong-email@example.com") }

#   context "when the current user is not authenticated" do
#     before { eval "#{method} #{path}" }

#       it "should redirect to the 'Sign in' page" do
#       expect(page).to have_content('Sign in')
#     end

#     it "should have a login notice" do
#       expect(page).to have_notice_message('Please log in')
#     end

#     describe "then authenticates and and is authorized" do

#       before do
#         eval "#{method} #{path}"
#         fill_in "Email", with: user.email
#         fill_in "Password", with: user.password
#         click_button "Sign in"
#       end

#       it 'should render the correct protected page' do
#         expect(page).to have_title(expected_title)
#       end
#     end
#   end

#   context "when the current user is authenticated but not authorized" do

#     before do
#       sign_in wrong_user, no_capybara: true
#       eval "#{method} #{path}"
#     end

#     it "should not have the #{expected_title}" do
#       expect(page).not_to have_title(full_title(expected_title))
#     end

#     it 'should redirect to the root url' do
#       expect(page).to redirect_to(root_url)
#     end

#     it 'should display an error message' do
#       expect(flash[:notice]).to eq "You are not authorized to complete that action"
#     end
#   end

#   context 'when current user is authorized' do

#     before do
#       sign_in user
#       eval "#{method} #{path}"
#     end

#     it 'should work' do
#       expect(page).to have_content('Update your profile')
#     end
#   end


# end

# describe 'Visting User#edit' do
#   it_should_behave_like 'a protected page' do
#     let(:page_url) { { path:edit_user_path(user) , method: 'visit' } }
#     let(:expected_content) { [] }
#     let(:expected_title) { 'Edit Profile' }
#   end
# end

# describe 'Patching User#edit' do
#   it_should_behave_like 'a protected page' do
#     let(:page_url) { { path:user_path(user) , method: 'patch' } }
#     let(:expected_content) { [] }
#     let(:expected_title) { 'Edit Profile' }
#   end
# end