class CreateExhibits < ActiveRecord::Migration
  def change
    create_table :exhibits do |t|
      t.text :attribution
      t.text :description
      t.datetime :inception
      t.string :medium
      t.string :uri

      t.timestamps
    end

    create_table :exhibits_landmarks, :id => false do |t|
      t.references :exhibit
      t.references :landmark
    end
    add_index :exhibits_landmarks, [:exhibit_id, :landmark_id]
  end
end
