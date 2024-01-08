class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :entities, foreign_key: :author_id
  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true
end
