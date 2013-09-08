# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :domain do
    name "MyString"
    distinct_id 1
  end
end
