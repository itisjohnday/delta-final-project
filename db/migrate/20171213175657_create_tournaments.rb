class CreateTournaments < ActiveRecord::Migration[5.1]
  def change
    create_table :tournaments do |t|
      t.string :theme, null: false 
      t.timestamps
    end
  end
end
