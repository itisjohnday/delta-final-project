class AddWinnerToTournaments < ActiveRecord::Migration[5.1]
  def change
    change_table :tournaments do |t|
      t.bigint :winner 
      end 
  end
end
