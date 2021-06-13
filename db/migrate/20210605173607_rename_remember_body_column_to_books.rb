class RenameRememberBodyColumnToBooks < ActiveRecord::Migration[5.2]
  def change
    rename_column :books, :book_opinion, :body
  end
end
