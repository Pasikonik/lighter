class Entry < ActiveRecord::Base
  mount_uploader :thumbnail, ThumbnailUploader
  belongs_to :user
  validates :title, :body, :thumbnail, presence: true
end
