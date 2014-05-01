require 'spec_helper'

describe "StaticPages" do
  subject { page }

  describe "Home Page" do
    before(:each) { visit root_path }

    it { should have_title('Home') }
  end

  describe "Help Page" do
    before(:each) { visit help_path }

    it { should have_title('Help') }
  end

  describe "About Page" do
    before(:each) { visit about_path }

    it { should have_title('About') }
  end

  describe "Contact Page" do
    before(:each) { visit contact_path }

    it { should have_title('Contact') }
  end
end
