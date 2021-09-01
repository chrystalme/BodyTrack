class Measurement < ApplicationRecord
  belongs_to :measure

  validates_presence_of :value, :date
end
