class AddThumbnailToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :thumbnail, :string
  end
end
