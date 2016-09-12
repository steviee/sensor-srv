class CreateReadings < ActiveRecord::Migration[5.1]
  def change
    create_table :readings do |t|
      t.float :temperature
      t.float :humidity
      t.string :sensor_id

      t.timestamps
    end
  end
end
