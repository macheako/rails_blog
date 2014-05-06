require 'spec_helper'

describe "StaticPages" do
  subject { page }

  describe "Home Page" do
    before(:each) { visit root_path }

    it { should have_title('Home') }

    describe "for signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        FactoryGirl.create(:micropost, user: user, content: "Lorem")
        FactoryGirl.create(:micropost, user: user, content: "Ipsum")
        sign_in user
        visit root_path
      end

      it "should render the user's feed" do
        user.feed.each do |item|
          expect(page).to have_selector("li##{item.id}", text: item.content)
        end
      end

      describe "follower/folling counts" do
        let(:other_user) { FactoryGirl.create(:user) }
        before do
          other_user.follow!(user)
          visit root_path
        end

        it { should have_link("0 following", href: following_user_path(user)) }
        it { should have_link("1 followers", href: follower_user_path(user)) }
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
