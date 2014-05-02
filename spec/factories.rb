FactoryGirl.define do
  factory :user do
    name      "Matthew Morton"
    email     "matthew.morton@hostdime.com"
    password  "foobar"
    password_confirmation "foobar" 
  end
end