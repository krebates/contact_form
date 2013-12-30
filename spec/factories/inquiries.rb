# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :inquiry do
    first_name "Krystle"
    last_name "Bates"
    email "krebates@gmail.com"
    subject "nice subject"
    description "words that describe"
  end
end
