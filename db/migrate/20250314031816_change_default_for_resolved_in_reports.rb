class ChangeDefaultForResolvedInReports < ActiveRecord::Migration[8.0]
  def change
    change_column :reports, :resolved, :boolean, default: false
  end
end
