class Transaction < ApplicationRecord
  belongs_to :category
  belongs_to :user

  validates :title, :amount, presence: true
end
