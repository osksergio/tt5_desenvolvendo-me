class CreateLectures < ActiveRecord::Migration[6.1]
  def change
    create_table :lectures do |t|
      t.string :description
      t.integer :duration
      t.references :conference, null: false, foreign_key: true
      t.references :track, null: true, foreign_key: true

      t.timestamps
    end
  end
end
