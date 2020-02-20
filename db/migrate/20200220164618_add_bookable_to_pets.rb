class AddBookableToPets < ActiveRecord::Migration[5.2]
  def change
    add_column :pets, :bookable, :boolean
  end
end
