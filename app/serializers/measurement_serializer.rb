class MeasurementSerializer
  include FastJsonapi::ObjectSerializer
  attributes :value, :date, :measure_id, :user_id
end
