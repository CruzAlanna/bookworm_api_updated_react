class AddAttributesToMeetingsTable < ActiveRecord::Migration[8.0]
  def change
    add_column :meetings, :selected_book, :string
    add_column :meetings, :genre, :string
  end
end
