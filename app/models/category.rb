class Category < ApplicationRecord
  belongs_to :user
  has_one_attached :icon
  has_many :transactions, dependent: :destroy

  validates :name, presence: true
  validates :icon, presence: true
end
