class CreateMatches < ActiveRecord::Migration[5.1]
  def change
    create_table :matches do |t|
      t.bigint :contestant_1_entry_id, null: false
      t.bigint :contestant_2_entry_id
      t.belongs_to :round
      t.timestamps
    end
  end
end
