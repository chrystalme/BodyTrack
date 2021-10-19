class MeasureSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :unit, :description, :image

  has_many :measurements
end
