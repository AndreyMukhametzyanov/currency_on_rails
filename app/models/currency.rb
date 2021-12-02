class Currency < ApplicationRecord
  validates :num_code, :char_code, :nominal, :name, :value, presence: true
  validates :num_code, :char_code, uniqueness: true
  #место для коментариев
end
