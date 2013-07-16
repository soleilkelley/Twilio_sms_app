class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :license_plate
      t.string :state
      t.string :zip

      t.timestamps
    end
  end
end
