require 'spec_helper'

describe "StaticPages" do

  describe "Home Page" do
    before { visit root_path }

    it "should have content 'Sample App'" do
      expect(page) .to have_content('home')
    end

    it "should have the base title" do
      expect(page) .to have_title('Ruby on Rails Tutorial')
    end

    it "should not have the title 'Home'" do
      expect(page) .to_not have_title('| Home')
    end
  end

  describe "Help Page" do
    before { visit help_path }

    it "should have the content 'Help'" do
      expect(page) .to have_content('Help')
    end

    it "should have the title 'Help'" do
      expect(page) .to have_title('Help')
    end
  end

  describe "About Page" do
    before { visit about_path }
    it "should have the content 'About Us'" do
      expect(page) .to have_content('About Us')
    end

    it "should have the title 'About Us'" do
      expect(page) .to have_title('About')
    end
  end

  describe "Contact Page" do
    before { visit contact_path }
    it "should have the content 'Contact'" do
      expect(page) .to have_content('Contact')
    end

    it "should have the title 'Contact'" do
      expect(page) .to have_title('Contact')
    end
  end
end