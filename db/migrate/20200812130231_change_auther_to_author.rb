# frozen_string_literal: true

class ChangeAutherToAuthor < ActiveRecord::Migration[5.2]
  def change
    rename_column :carsnews, :auther_id, :author_id
  end
end
