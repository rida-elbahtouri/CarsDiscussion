class CreateCarsnews < ActiveRecord::Migration[5.2]
  def change
    create_table :carsnews do |t|
      t.integer :auther_id
      t.text :text
      t.timestamps
      t.index :auther_id
    end
  end
end
