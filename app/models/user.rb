class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  has_one :token, dependent: :destroy
end
