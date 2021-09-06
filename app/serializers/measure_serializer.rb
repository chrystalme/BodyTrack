class MeasureSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :description, :image

  has_many :measurements
end
