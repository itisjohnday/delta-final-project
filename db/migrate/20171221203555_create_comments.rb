class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.belongs_to :media_link
      t.string :username
      t.string :description
      t.timestamps
    end
  end
end
