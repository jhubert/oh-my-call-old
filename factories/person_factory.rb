FactoryGirl.define do
  factory :person do
    phone_number { Faker::PhoneNumber.phone_number}
    fullname { Faker::Name.name }

  end
end
