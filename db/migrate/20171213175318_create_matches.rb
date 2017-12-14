class CreateMatches < ActiveRecord::Migration[5.1]
  def change
    create_table :matches do |t|
      t.integer :contestant_1_entry_id, null: false
      t.integer :contestant_2_entry_id
      t.belongs_to :round
      t.timestamps
    end
  end
end
