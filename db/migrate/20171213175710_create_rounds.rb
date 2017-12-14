class CreateRounds < ActiveRecord::Migration[5.1]
  def change
    create_table :rounds do |t|
      t.string :name
      t.belongs_to :tournament
      t.timestamps
    end
  end
end
