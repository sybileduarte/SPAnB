class DeleteRaceAndAddForeignReferenceFromPets < ActiveRecord::Migration[5.2]
  def change
    remove_column :pets, :race
    add_reference :pets, :race, foreign_key: true
  end
end
