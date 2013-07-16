class AddNicknameToCars < ActiveRecord::Migration
  def change
    add_column :cars, :nickname, :string
  end
end
