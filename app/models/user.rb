class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  has_many :entities, foreign_key: :author_id, dependent: :destroy
  has_many :categories, dependent: :destroy
  has_many :groups, dependent: :destroy
  validates :name, presence: true
  validates :email, presence: true
end
