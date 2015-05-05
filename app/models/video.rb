class Video < ActiveRecord::Base
  mount_uploader :source, VideoUploader
  belongs_to :user
end
