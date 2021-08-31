class User < ApplicationRecord
  has_secure_password
  has_many :measurements, foreign_key: true
  
  validates_presence_of :name, :email, :password_digest
end
