FactoryBot.define do
  factory :property do
    name { "MyString" }
    location { "MyString" }
    price { 200.99 }
    status { [:available, :sold].sample }
  end
end
