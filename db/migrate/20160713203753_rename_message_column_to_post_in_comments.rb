class RenameMessageColumnToPostInComments < ActiveRecord::Migration
  def change
    rename_column :comments, :message_id, :post_id
  end
end
