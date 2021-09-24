class MeasurementSerializer
  include FastJsonapi::ObjectSerializer
  attributes :value, :measure_id, :user_id, :created_at

  # belongs_to :measure
end
