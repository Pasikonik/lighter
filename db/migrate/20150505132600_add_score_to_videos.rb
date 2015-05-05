class AddScoreToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :score, :float, :default => 0
  end
end
