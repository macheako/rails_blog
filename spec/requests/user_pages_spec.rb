require 'spec_helper'

describe "UserPages" do

  subject { page }

  describe "Signup Page" do
    before(:each) { visit signup_path }

    it { should have_title('Sign up') }
  end
end
