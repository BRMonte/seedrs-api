class Campaign < ApplicationRecord
  has_many :investments

  validates :name, presence: true, length: { minimum: 2 }
  validates :target_amount, presence: true
  validates :investment_multiple, presence: true
end
