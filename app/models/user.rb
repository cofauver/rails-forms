class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  has_many :token, dependent: :destroy
end
