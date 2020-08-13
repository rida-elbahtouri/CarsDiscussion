class ChangeCarsnewsToThoughts < ActiveRecord::Migration[5.2]
  def change
    rename_table :carsnews, :thoughts
  end
end
