class CreateMediaLinks < ActiveRecord::Migration[5.1]
  def change
    create_table :media_links do |t|
      t.belongs_to  :user
      t.string      :link
      t.string      :link_type

      t.timestamps
    end
  end
end
