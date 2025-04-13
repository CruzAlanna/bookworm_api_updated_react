class CreateMeetings < ActiveRecord::Migration[8.0]
  def change
    create_table :meetings do |t|
      t.string :date
      t.string :time

      t.timestamps
    end
  end
end
