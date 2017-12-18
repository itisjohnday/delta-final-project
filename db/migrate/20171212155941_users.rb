class Users < ActiveRecord::Migration[5.1]
  def change
    change_table :users do |t|
      t.string :profile_pic
    end
  end
end
