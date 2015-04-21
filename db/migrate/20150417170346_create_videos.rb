class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.string :description
      t.references :rating
      t.references :user, index: true, foreign_key: true
      t.string :source

      t.timestamps null: false
    end
  end
end
