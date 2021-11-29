FactoryBot.define do
  factory :currency do
    num_code { "777" }
    char_code { "MYC" }
    nominal {100}
    name { "My Currency" }
    value { 12.12 }
  end
end
