class AddColumnUnitToMeasure < ActiveRecord::Migration[6.1]
  def change
    add_column :measures, :unit, :string
  end
end
