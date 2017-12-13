class CreateEntries < ActiveRecord::Migration[5.1]
  def change
    create_table :entries do |t|

      t.timestamps
    end
  end
end
