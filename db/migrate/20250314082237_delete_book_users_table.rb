class DeleteBookUsersTable < ActiveRecord::Migration[8.0]
  def change
    drop_table :book_users
  end
end
