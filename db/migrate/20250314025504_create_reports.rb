class CreateReports < ActiveRecord::Migration[8.0]
  def change
    create_table :reports do |t|
      t.string :issue
      t.boolean :resolved

      t.timestamps
    end
  end
end
