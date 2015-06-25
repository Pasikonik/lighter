class CreateTutorials < ActiveRecord::Migration
  def change
    create_table :tutorials do |t|
      t.string :title
      t.string :video
      t.integer :level

      t.timestamps null: false
    end
  end
end
