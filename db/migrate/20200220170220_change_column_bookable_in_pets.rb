class ChangeColumnBookableInPets < ActiveRecord::Migration[5.2]
  def change
    change_column :pets, :bookable, :boolean, :default => true
  end
end
