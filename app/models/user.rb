# typed: true

class User < ApplicationRecord
  has_many :microposts, dependent: :destroy
  normalizes :email, with: ->(email) { email.strip.downcase }

  validates :email, presence: true, length: { maximum: 255 }, uniqueness: { case_sensitive: false }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :name, presence: true, length: { maximum: 50 }
end
