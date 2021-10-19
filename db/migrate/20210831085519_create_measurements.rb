class CreateMeasurements < ActiveRecord::Migration[6.1]
  def change
    create_table :measurements do |t|
      t.integer :value
      t.timestamp :date
      t.references :measure, null: false, foreign_key: true

      t.timestamps
    end
  end
end
