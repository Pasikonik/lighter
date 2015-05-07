class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :src
      t.integer :type

      t.timestamps null: false
    end
  end
end
