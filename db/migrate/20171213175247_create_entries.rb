class CreateEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :entries do |t|
      t.integer :vote_count, null: false, default: 0
      t.belongs_to :pets_media_link
      t.timestamps
    end
  end
end
