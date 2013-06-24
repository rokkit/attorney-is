FactoryGirl.define do
  factory :user do
    fio 'Test User'
    email 'example@example.com'
    password 'password'
    password_confirmation 'password'
    register_number '1234'
    phone '79523707281'
    # required if the Devise Confirmable module is used
    #confirmed_at Time.now
    factory :common_user do
      admin false
    end
  end
end