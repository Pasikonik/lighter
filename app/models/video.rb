class Video < ActiveRecord::Base
  mount_uploader :source, VideoUploader
  acts_as_taggable
  belongs_to :user
end
