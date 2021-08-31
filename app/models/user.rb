class User < ApplicationRecord
  has_many :measurements, foreign_key: true
  
end
