class RemoveDateFromMeasurement < ActiveRecord::Migration[6.1]
  def change
    remove_column :measurements, :date, :datetime
  end
end
