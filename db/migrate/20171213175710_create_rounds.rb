class CreateRounds < ActiveRecord::Migration[5.1]
  def change
    create_table :rounds do |t|
      t.integer :round_type_id
      belongs_to :tournament
      t.timestamps
    end
  end
end
