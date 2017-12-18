class CreatePets < ActiveRecord::Migration[5.1]
  def change
    create_table :pets do |t|
      t.belongs_to :user
      t.string :name, null: false
      t.string :breed, null: false
      t.timestamps
    end
  end
end
