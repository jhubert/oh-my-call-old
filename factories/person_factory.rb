FactoryGirl.define do
  factory :person do
    phone_number { Faker::PhoneNumber.phone_number}
    fullname { Faker::Lorem.words.join(" ") }

  end
end
