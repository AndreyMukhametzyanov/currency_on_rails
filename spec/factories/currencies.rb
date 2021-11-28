FactoryBot.define do
  factory :currency do
    # sequence(:phone) { |i| 70000000000 + i }
    num_code { "777" }
    char_code { "MYC" }
    nominal {100}
    name { "My Currency" }
    value { 12.12 }
  end
end
