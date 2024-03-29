class Entity < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_and_belongs_to_many :groups

  validates :name, presence: true
  validates :amount, presence: true
end
