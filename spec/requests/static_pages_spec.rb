require 'spec_helper'

describe "StaticPages" do

  describe "Home Page" do
    it "should have content 'Home'" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit home_path
      expect(page) .to have_content('home')
    end

    it "should have title 'Home'" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      visit home_path
      expect(page) .to_not have_title('Home')
    end
  end

  describe "Help Page" do
    it "should have the content 'Help'" do
      visit help_path
      expect(page) .to have_content('Help')
    end

    it "should have the title 'Help'" do
      visit help_path
      expect(page) .to have_title('Help')
    end
  end

  describe "About Page" do
    it "should have the content 'About Us'" do
      visit about_path
      expect(page) .to have_content('About Us')
    end

    it "should have the title 'About Us'" do
      visit about_path
      expect(page) .to have_title('About')
    end
  end

  describe "Contact Page" do
    it "should have the content 'Contact'" do
      visit contact_path
      expect(page) .to have_content('Contact')
    end

    it "should have the title 'Contact'" do
      visit contact_path
      expect(page) .to have_title('Contact')
    end
  end
end