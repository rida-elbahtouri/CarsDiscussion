class CreatePhotosTable < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
        t.string :avatar
        t.string :cover_photo
        t.integer :user_id
        
        t.timestamps
    end
  end
end
