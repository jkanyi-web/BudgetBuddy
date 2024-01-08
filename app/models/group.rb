class Group < ApplicationRecord
  has_and_belongs_to_many :entities

  validates :name, presence: true
  validates :icon, presence: true
end
