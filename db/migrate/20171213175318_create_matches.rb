class CreateMatches < ActiveRecord::Migration[5.1]
  def change
    create_table :matches do |t|
      t.integer :contestant_1_entry_id
      t.integer :contestant_2_entry_id
      belongs_to :round
      t.timestamps
    end
  end
end
