class CreateMeasures < ActiveRecord::Migration[6.1]
  def change
    create_table :measures do |t|
      t.string :title
      t.string :description
      t.string :image

      t.timestamps
    end
  end
end
