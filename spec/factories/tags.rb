FactoryGirl.define do
  factory :tag, class: SimpleTags::Tag do
    name { Faker::Name.name }
  end
end
