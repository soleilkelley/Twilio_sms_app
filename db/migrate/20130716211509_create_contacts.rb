class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :type
      t.string :value

      t.timestamps
    end
  end
end
