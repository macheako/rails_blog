require 'spec_helper'

describe "StaticPages" do
  subject { page }

  describe "Home Page" do
    before(:each) { visit root_path }

    it { should have_title('Home') }

    describe "for signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        FactoryGirl.create(:micropost, user: user, content: "Lorem ipsum")
        FactoryGirl.create(:micropost, user: user, content: "Dolor sit amet")
        sign_in user
        visit root_path
      end

      it "should render the user's feed" do
        user.feed.each do |item|
          expect(page).to have_selector("li##{item.id}", text: item.content)
        end
      end
    end
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
