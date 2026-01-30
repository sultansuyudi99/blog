class AddForeignKeyToMicroposts < ActiveRecord::Migration[8.1]
  def change
    add_foreign_key(:microposts, :users)
  end
end
