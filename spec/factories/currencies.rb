FactoryBot.define do
  factory :currency do
    sequence(:phone) { |i| 70000000000 + i }
    num_code { "MyString" }
    char_code { "MyString" }
    nominal
    name { "2021-11-06 17:32:38" }
    value { "my_comment" }
  end
end
