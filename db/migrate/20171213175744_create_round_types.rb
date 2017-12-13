class CreateRoundTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :round_types do |t|

      t.timestamps
    end
  end
end
