class Currency < ApplicationRecord
  validates :NumCode, :CharCode, :Nominal, :Name, :Value, presence: true
  validates :NumCode, :CharCode, uniqueness: true
end
