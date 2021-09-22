class MeasurementSerializer
  include FastJsonapi::ObjectSerializer
  attributes :value, :measure_id, :user_id
end
