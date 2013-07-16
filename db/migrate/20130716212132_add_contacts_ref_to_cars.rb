class AddContactsRefToCars < ActiveRecord::Migration
  def change
    add_reference :cars, :contacts, index: true
  end
end
