class RenameUserIdToAuthorIdInGossips < ActiveRecord::Migration[8.0]
  def change
    rename_column :gossips, :user_id, :author_id
  end
end
