class Pets < ActiveRecord::Migration[5.1]
  def change
    change_table :pets do |t|
      t.string :profile_pic
    end
  end
end
