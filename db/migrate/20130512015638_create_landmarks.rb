class CreateLandmarks < ActiveRecord::Migration
  def change
    create_table :landmarks do |t|
      t.string :name
      t.text :description
      t.text :lpc_type
      t.text :tags
      t.text :founders
      t.float :lat
      t.float :lng
      t.datetime :inception
      t.datetime :designation
      t.string :slug

      t.timestamps
    end
  end
end
