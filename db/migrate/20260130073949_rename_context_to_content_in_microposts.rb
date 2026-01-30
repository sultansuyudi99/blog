class RenameContextToContentInMicroposts < ActiveRecord::Migration[8.1]
  def change
    rename_column(:microposts, :context, :content)
  end
end
