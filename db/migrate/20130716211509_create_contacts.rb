class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.belongs_to :car
      t.string :kind
      t.string :value

      t.timestamps
    end
  end
end
