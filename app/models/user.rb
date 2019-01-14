class User < ApplicationRecord
  has_many :portfolios

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
end
