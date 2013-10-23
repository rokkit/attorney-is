# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :inform_mail do
    user nil
    body "MyText"
  end
end
