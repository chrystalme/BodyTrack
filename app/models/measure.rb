class Measure < ApplicationRecord
  has_many :measurements, dependent: :destroy

  validates_presence_of :title, :image, :description
end
