class AddSummaryToLandmarks < ActiveRecord::Migration
  def change
    add_column :landmarks, :summary, :text
  end
end
