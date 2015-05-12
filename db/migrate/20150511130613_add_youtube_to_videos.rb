class AddYoutubeToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :remote, :string
  end
end
