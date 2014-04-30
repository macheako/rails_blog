require 'spec_helper'

describe "StaticPages" do
  describe "Home Page" do

    it "should have the title 'Home'" do
      visit '/static_pages/home'
      expect(page).to have_title("Ruby on Rails Tutorial | Home")
    end
  end

  describe "Help Page" do

    it "should have the title 'Help'" do
      visit '/static_pages/help'
      expect(page).to have_title("Ruby on Rails Tutorial | Help")
    end
  end

  describe "About Page" do
    
    it "should have the title 'About Us'" do
      visit '/static_pages/about'
      expect(page).to have_title("Ruby on Rails Tutorial | About")
    end
  end
end
