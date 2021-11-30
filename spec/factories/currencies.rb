FactoryBot.define do
  factory :currency do
    sequence(:num_code) { |i| "777" * i }
    sequence(:char_code) { |j| "MYC" * j }
    nominal { 100 }
    name { "My Currency" }
    value { 12.12 }
  end
end
