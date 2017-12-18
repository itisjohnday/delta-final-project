class CreatePetsMediaLinks < ActiveRecord::Migration[5.1]
  def change
    create_table :pets_media_links do |t|
      t.belongs_to :media_link 
      t.belongs_to :pet 
      t.timestamps
    end
  end
end
