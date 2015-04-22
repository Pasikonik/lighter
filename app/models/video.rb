class Video < ActiveRecord::Base
  ratyrate_rateable 'overall'
  is_impressionable
  mount_uploader :source, VideoUploader
  belongs_to :user
end
